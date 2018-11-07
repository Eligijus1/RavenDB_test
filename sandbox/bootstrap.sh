#!/usr/bin/env bash

echo "# IPv4 and IPv6 localhost aliases:" | sudo tee /etc/hosts
echo "127.0.0.1 vagrant.RavenDB.test.com  vagrant.RavenDB.test  localhost" | sudo tee -a /etc/hosts
echo "::1       vagrant.RavenDB.test.com  vagrant.RavenDB.test  localhost" | sudo tee -a /etc/hosts
echo "10.0.2.15 vagrant.RavenDB.test.com  vagrant.RavenDB.test  localhost" | sudo tee -a /etc/hosts

# Update packages:
apt-get update

# Install nmap:
sudo apt-get install -y nmap

# Apache install:
apt-get install -y apache2
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi

# Installing PHP 7.2 and some extra libraries:
sudo apt-get install -y php
sudo apt-get install -y php-curl

# Check loaded PHP modules:
#php -m

# Add DNS to /etc/resolv.conf
echo "nameserver 8.8.8.8" | sudo tee -a /etc/resolv.conf
echo "nameserver 8.8.4.4" | sudo tee -a /etc/resolv.conf

# Install composer:
cd /tmp/
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

# Install git:
sudo apt-get install -y git

# Install RavenDB:
cd /home/vagrant/
wget -O RavenDB.tar.bz2 https://hibernatingrhinos.com/downloads/RavenDB%20for%20Linux%20x64/latest
tar xvjf RavenDB.tar.bz2
rm -fr *.tar.bz2

#Server/settings.json
#{
#    "ServerUrl": "http://172.28.128.13:8080",
#    "PublicServerUrl": "http://vagrant.ravendb.test:8080",
#    "Security.UnsecuredAccessAllowed": "PublicNetwork",
#    "Setup.Mode": "Initial",
#    "DataDir": "RavenData"
#}

#https://ravendb.net/docs/article-page/4.1/csharp/start/installation/setup-examples/aws-linux-vm
#/etc/systemd/system/ravendb.service,
#sudo systemctl daemon-reload
#sudo systemctl enable ravendb.service
#sudo systemctl start ravendb.service




