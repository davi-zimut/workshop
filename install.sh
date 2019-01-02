#!/bin/bash

apt-get update
apt-get upgrade -y

apt-get install -y apt-transport-https ca-certificates curl software-properties-common git
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce
systemctl enable docker

useradd --comment 'Git' --create-home git --shell /bin/bash
usermod -a -G sudo git

docker-compose up -d
