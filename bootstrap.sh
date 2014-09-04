#!/usr/bin/env bash

apt-get update > /dev/null

apt-get install -y python-software-properties
add-apt-repository ppa:webupd8team/java
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'

apt-get update > /dev/null

apt-get install -y zip unzip git

echo debconf shared/accepted-oracle-license-v1-1 select true |  sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true |  sudo debconf-set-selections
apt-get install -y oracle-java7-installer oracle-java7-set-default
apt-get install -y oracle-java6-installer
apt-get install -y oracle-java8-installer
export JAVA_HOME=/usr/lib/jvm/java-7-oracle/

sudo apt-get install -y maven libxrender-dev libxtst-dev

sudo apt-get install -y jenkins jenkins-cli

sleep 50

/vagrant/jenkins.sh


