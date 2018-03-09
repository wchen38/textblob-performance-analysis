#! /bin/sh
apt-get -qq update
apt-get -qq -y install curl


apt-get -y install git
apt-get -y install python
apt-get -y install python-pip
pip install --upgrade pip
git clone https://github.com/sloria/TextBlob.git
pip install -U textblob

