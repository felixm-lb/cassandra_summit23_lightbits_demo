#!/bin/bash

# Enable NVME
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y linux-modules-extra-aws
sudo modprobe nvme-tcp
sudo apt install -y nvme-cli

# Install Cassandra
sudo apt install -y openjdk-11-jdk openjdk-11-jre
sudo apt install -y wget
wget -q -O - https://www.apache.org/dist/cassandra/KEYS | sudo apt-key add -
echo "deb http://www.apache.org/dist/cassandra/debian 40x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list deb http://www.apache.org/dist/cassandra/debian 40x main
sudo apt-get update -y
sudo apt install cassandra -y
sudo systemctl enable cassandra