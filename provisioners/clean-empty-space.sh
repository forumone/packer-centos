#!/bin/bash

# remove VBox build packages
yum -y remove kernel-devel kernel-headers dkms

# Remove extraneous packages
yum -y remove *firmware*
yum -y install yum-utils
package-cleanup --leaves --quiet |xargs yum -y remove

# Clean cache
yum -y clean all 

# Clean out all of the caching dirs
rm -rf /var/cache/* /usr/share/doc/* /tmp/*

# Clean up unused disk space so compressed image is smaller.
dd if=/dev/zero of=/zero.fill bs=4M
rm /zero.fill
