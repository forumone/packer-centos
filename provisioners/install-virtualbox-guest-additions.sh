#!/bin/bash

# Virtualbox prereqs
yum install -y kernel-devel kernel-headers dkms make bzip2 gcc perl

# Mount the disk image
cd /tmp
mkdir /tmp/isomount
mount -t iso9660 -o loop /tmp/VBoxGuestAdditions.iso /tmp/isomount

# Install the drivers
/tmp/isomount/VBoxLinuxAdditions.run

# Cleanup
umount isomount
rm -rf isomount /root/VBoxGuestAdditions.iso
