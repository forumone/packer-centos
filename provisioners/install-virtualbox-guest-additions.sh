#!/bin/bash

# Install pre-reqs
yum install -y kernel-devel kernel-headers dkms make gcc bzip2 patch 

# Mount the disk image
mount -o loop,ro /tmp/VBoxGuestAdditions.iso /mnt

# Extract the archive so we can patch it
/mnt/VBoxLinuxAdditions.run --noexec --target /tmp

# Extract the AMD64 source to patch for CentOS 7 Kernel
mkdir /tmp/t
tar xjf /tmp/VBoxGuestAdditions-amd64.tar.bz2 -C /tmp/t

# Patch the sucker
cd /tmp/t
patch src/vboxguest-4.3.12/vboxguest/r0drv/linux/memobj-r0drv-linux.c <<'EOF'
--- memobj-r0drv-linux.c  2014-07-09 21:54:43.780408502 -0400
+++ memobj-r0drv-linux.c.new  2014-07-09 22:08:47.529644691 -0400
@@ -1533,14 +1533,8 @@
                 /** @todo Ugly hack! But right now we have no other means to disable
                  *        automatic NUMA page balancing. */
 # ifdef RT_OS_X86
-#  if LINUX_VERSION_CODE < KERNEL_VERSION(3, 13, 0)
-                pTask->mm->numa_next_reset = jiffies + 0x7fffffffUL;
-#  endif
                 pTask->mm->numa_next_scan  = jiffies + 0x7fffffffUL;
 # else
-#  if LINUX_VERSION_CODE < KERNEL_VERSION(3, 13, 0)
-                pTask->mm->numa_next_reset = jiffies + 0x7fffffffffffffffUL;
-#  endif
                 pTask->mm->numa_next_scan  = jiffies + 0x7fffffffffffffffUL;
 # endif
             }
EOF

# Tar it back up for install
tar cjpf ../VBoxGuestAdditions-amd64.tar.bz2 .
cd ../
./install.sh

# Cleanup
umount /mnt
rm -rf /tmp/VBoxGuestAdditions.iso 

chmod 1777 /tmp
