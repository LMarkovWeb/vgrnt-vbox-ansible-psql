#!/bin/bash

# only for test_server

set -euo pipefail

USER=ansible
PASS=ansible

sudo useradd -p $(openssl passwd -1 $PASS) $USER
sudo usermod -aG wheel $USER

sudo echo '%sudo ALL=(ALL:ALL) NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo

sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config

sudo service sshd restart