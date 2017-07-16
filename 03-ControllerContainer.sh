#!/bin/bash

# Get the container configs and build/configure/launch the
# container for the controller





# First get the container configuration data
git clone git@github.com:rgrandin/docker-unifi.git



# Enter the new directory and run the setup scripts
cd docker-unifi.git
./directories.setup  # Configures directories on this host machine for container usage
./create.sh          # Builds the container image & starts the container
./systemd.setup      # Configures the container for auto-start at system boot
./firewall.setup     # Updates firewalld to pass necessary ports

