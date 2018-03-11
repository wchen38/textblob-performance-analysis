#! bin/bash
#git clone https://github.com/wchen38/textblob-performance-analysis.git
#cd textblob-performance-analysis/docker
#sudo apt-get install R
#sudo apt-get install r-base
sudo docker build --build-arg CACHE_DATE=$(2018-3-16) -t test1 .
