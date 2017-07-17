#!/bin/bash

# Get the container configs and build/configure/launch the
# container for the controller





# First get the container configuration data
cd ..
git clone https://github.com/rgrandin/UniFi-Video-Controller.git



# Enter the new directory and run the setup scripts
cd UniFi-Video-Controller 
./directories.setup  # Configures directories on this host machine for container usage
./create.sh          # Builds the container image & starts the container
./systemd.setup      # Configures the container for auto-start at system boot
./firewall.setup     # Updates firewalld to pass necessary ports

