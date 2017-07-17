#!/bin/bash

# Perform preliminary tasks for running the docker containers



# First, start and enable the docker service
systemctl start docker.service
systemctl enable docker.service



# Next, create 'dockeruser' with ID 1001 for ownership of
# data directories
useradd dockeruser
chown -R dockeruser:dockeruser /home/data


# Create root dir for containers to use for their data
mkdir /home/data


# Add SELinux info for this directory to enable to containers to read/write 
# from it
chcon -Rt svirt_sandbox_file_t /home/data


# Disable SELinux because it's causing problems
setenforce 0
sed -i -e 's/SELINUX=enforcing/SELINUX=permissive/' /etc/selinux/config 

echo ""
echo ""
echo "Directory /home/data created"
echo ""
echo "You must now manually configure the large-capacity storage to"
echo "use this location.  Options include:"
echo "  1.) Removing this directory and making a symlink, called /home/data,"
echo "      to the internal storage volume where data will be stored."
echo "  2.) Mounting an external storage device at this location."
echo "      Note that this option will require /etc/fstab to be updated"
echo "      so the external device is accessible after reboot."
echo ""
echo ""

