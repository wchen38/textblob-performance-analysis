#! /bin/sh
apt-get -qq update
apt-get -qq -y install curl


apt-get -y install git
apt-get -y install python
apt-get -y install python-pip

pip install numpy
pip install --upgrade pip
pip install -U textblob
pip install nltk
pip install --upgrade nltk
python -m textblob.download_corpora

git clone https://github.com/sloria/TextBlob.git
git clone https://github.com/wchen38/textblob-performance-analysis.git
cd textblob-performance-analysis
cd src
python text_blob.py ../inputs/t1/small1 2
