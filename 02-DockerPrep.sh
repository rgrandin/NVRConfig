#!/bin/bash

# Perform preliminary tasks for running the docker containers



# First, start and enable the docker service
systemctl start docker.service
systemctl enable docker.service



# Next, create 'dockeruser' with ID 1001 for ownership of
# data directories
useradd --uid 1001 --gid 1001 dockeruser
chown -R dockeruser:dockeruser /data


# Create root dir for containers to use for their data
mkdir /data


# Add SELinux info for this directory to enable to containers to read/write 
# from it
chcon -Rt svirt_sandbox_file_t /data


echo ""
echo ""
echo "Directory /data created"
echo ""
echo "You must now manually configure the large-capacity storage to"
echo "use this location.  Options include:"
echo "  1.) Removing this directory and making a symlink, called /data,"
echo "      to the internal storage volume where data will be stored."
echo "  2.) Mounting an external storage device at this location."
echo "      Note that this option will require /etc/fstab to be updated"
echo "      so the external device is accessible after reboot."
echo ""
echo ""

