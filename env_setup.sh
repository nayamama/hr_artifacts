#!/bin/bash

apt-get remove docker docker-engine docker.io containerd runc
apt-get update
apt-get install apt-transport-https \
ca-certificates curl gnupg-agent software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"

apt-get update
apt-get install docker-ce docker-ce-cli containerd.io -y

cp /var/lib/docker/artifacts/docker-compose /usr/local/bin/docker-compose

swapoff -a

sed -i 's/\<console=ttyS0,115200n8\>/& cgroup_enable=memory swapaccount=1/' /etc/default/grub
sudo update-grub

reboot
