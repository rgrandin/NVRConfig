#!/bin/bash

# Install additional software components on top of the
# minimal CentOS 7 installation.




# First, install graphical KDE environment to make local
# logins of non-techical folks a bit less scary.
# 
# The '-y' option assumes "yes" when prompted so the
# install doesn't require user interaction.
yum -y groupinstall "KDE Plasma Workspaces"
yum -y install wget



# Next add the EPEL repository for access to some extra
# handy tools.
wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-10.noarch.rpm
rpm -ivh epel-release-7-10.noarch.rpm




# Next, install additional handy software
yum -y install htop screen smartmontools wireshark docker git OpenIPMI ipmitool ipmiutil vim

# Descriptions:
#  htop: System process manager, like 'top', but more human-readable.
#  screen: Terminal multiplexer.  Enable multiple terminals with a single login
#    and provide ability to leave a terminal running after disconnection.
#  smartmontools: Hard drive montitoring tools.
#  wireshark: Network diagnostic tools.
#  docker: Container infrastructure for Ubiquity services.
#  git: Version-control system used to get container configurations.
#  OpenIPMI, ipmitool, ipmiutil: Tools for utilizing the IPMI capabilities
#    of the server
#  vim: VI Improved text editor



# Enable SSH and set default boot target to graphical
systemctl start sshd
systemctl enable sshd
systemctl set-default graphical.target



# Reboot system to enable graphical usage in case that is helpful for the user
echo ""
echo " Rebooting into graphical environment in 10 seconds"
echo ""
sleep 10
reboot

