#!/bin/bash
#eck1851@rit.edu
#emma knupp


#the goal of this script is to download all of the necessary packages and files
#to run the sliver C2 server
#i think eventually i want to try and set this up with ansible (i started as you can see with the ansible files lol)
#but for the sake of not ripping all my hair out, it's a bash script for now


#installs the necessary packages for sliver to run properly
apt-get install build-essential mingw-w64 binutils-mingw-w64 g++-mingw-w64 -y


#installs the current version of the sliver client and server files from the github link
#places them in usr/loca/bin/sliver so they can be used as env variables, can call with just "sliver" in term
#changes the permissions on the file to 755 which is rwx for owner, rx for group and other

wget -O /usr/local/bin/sliver-server \
    https://github.com/BishopFox/sliver/releases/download/v1.5.41/sliver-server_linux && \
    chmod 755 /usr/local/bin/sliver-server

wget -O /usr/local/bin/sliver \
    https://github.com/BishopFox/sliver/releases/download/v1.5.17/sliver-client_linux && \
    chmod 755 /usr/local/bin/sliver

#force unpacks the assets for the server 
sliver-server unpack --force

#the file sliver.service is created with the following contents to make it executable with systemctl 
echo "[Unit]
Description=Sliver
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
Restart=on-failure
RestartSec=3
User=root
ExecStart=/usr/local/bin/sliver-server daemon

[Install]
WantedBy=multi-user.target" >> /etc/systemd/system/sliver.service

#changes perms to 600 which is rw for owner and nothing otherwise
chmod 600 /etc/systemd/system/sliver.service


# IGNORE THE REST, i need to try and fix some things with this eventually for using it in class
#correct directions for deployment can be found in the readme file






#now that the server has been setup, you can run commands through the server
#but since this will likely be used by a whole team, need to enable multiplayer and attach a client


#sliver-server <<EOF
#multiplayer
#new-operator --name test --lhost 127.0.0.1 /root/.sliver-client/configs
#EOF

#i couldn't get this last section to work running in the same script, but running the last command separately 
#isn't a huge deal i don't think 

#now have the test user "join the game"! also need to start the service since we are running as the client now

#systemctl start sliver

#sliver


#basically, if you run the above commands in a new window with the sliver server still open in another tab
#you'll be able to see something along the lines of 'test user has joined the game'!
#you can definitely just run commands from the server, but it's supposed to be better and easier for a team
#if you create the users and run them separately. 
#then whenever you run 'sliver' on the host that joined as the test user it'll automatically load the test user config files

