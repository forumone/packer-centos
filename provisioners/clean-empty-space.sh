#!/bin/bash		

# Saves ~25M
yum -y remove kernel-devel kernel-headers

# Clean cache
yum clean all

# Clean out all of the caching dirs
rm -rf /var/cache/* /usr/share/doc/*

# Clean up unused disk space so compressed image is smaller.
dd if=/dev/zero of=/zero.fill bs=4M
rm /zero.fill
