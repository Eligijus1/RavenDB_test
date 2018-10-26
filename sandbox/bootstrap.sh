#!/usr/bin/env bash

echo "# IPv4 and IPv6 localhost aliases:" | sudo tee /etc/hosts
echo "127.0.0.1 vagrant.RavenDB.test.com  vagrant.RavenDB.test  localhost" | sudo tee -a /etc/hosts
echo "::1       vagrant.RavenDB.test.com  vagrant.RavenDB.test  localhost" | sudo tee -a /etc/hosts
echo "10.0.2.15 vagrant.RavenDB.test.com  vagrant.RavenDB.test  localhost" | sudo tee -a /etc/hosts

#sudo ex +"%s@DPkg@//DPkg" -cwq /etc/apt/apt.conf.d/70debconf
#sudo dpkg-reconfigure debconf -f noninteractive -p critical

# Fixing languages:
#sudo apt-get install -y language-pack-en-base
#sudo LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php

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
#sudo apt-get install -y php7.2
#sudo apt-get install -y php7.1-xml 
#sudo apt-get install -y php7.1-bz2
#sudo apt-get install -y php7.1-dev
#sudo apt-get install -y php7.1-sqlite3
#sudo apt-get install -y php7.1-curl
#sudo apt-get install -y php7.1-intl
#sudo apt-get install -y php7.1-gd
#sudo apt-get install -y php7.1-mbstring
#sudo apt-get install -y php7.1-zip
#sudo apt-get install -y php7.1-mysql
#sudo apt-get install -y php7.1-bcmath
#sudo apt-get install -y php7.1-xdebug
#sudo apt-get install -y php7.1-apc

# Check loaded PHP modules:
#echo "Loaded PHP extensions:"
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
wget https://hibernatingrhinos.com/downloads/RavenDB%20for%20Linux%20x64/41004
wget https://hibernatingrhinos.com/downloads/RavenDB%20Tools%20for%20Linux%20x64/41004
