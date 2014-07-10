#!/bin/bash		

# Quicken the boots
sed -i 's/GRUB_TIMEOUT.*/GRUB_TIMEOUT=1/' /etc/default/grub

# Saves ~25M
yum -y remove kernel-devel kernel-headers

# Remove unnecessary firmware files
yum remove *firmware* -y

# Clean cache
yum clean all -y

# Clean out all of the caching dirs
rm -rf /var/cache/* /usr/share/doc/*
cd /tmp && rm -rf * 

# Clean up unused disk space so compressed image is smaller.
#dd if=/dev/zero of=/zero.fill bs=4M
#rm /zero.fill
