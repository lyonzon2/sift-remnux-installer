#!/bin/bash

# Download the cast tool and install it
sudo wget -O /tmp/cast-v0.15.2-linux-amd64.deb https://github.com/ekristen/cast/releases/download/v0.15.2/cast-v0.15.2-linux-amd64.deb
sudo dpkg -i /tmp/cast-v0.15.2-linux-amd64.deb
sudo rm /tmp/cast-v0.15.2-linux-amd64.deb

# Set up SaltStack key and sources
sudo mkdir -p /etc/apt/keyrings
sudo curl -fsSL https://packages.broadcom.com/artifactory/api/security/keypair/SaltProjectKey/public | sudo tee /etc/apt/keyrings/salt-archive-keyring.pgp
sudo curl -fsSL https://github.com/saltstack/salt-install-guide/releases/latest/download/salt.sources | sudo tee /etc/apt/sources.list.d/salt.sources

# Update the package list
sudo apt update

# Install SIFT using cast
sudo cast install --mode=server teamdfir/sift-saltstack
