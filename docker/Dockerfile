#use this to clear cache $docker build --no-cache -t test1 .
from ubuntu

COPY docker_setup.sh /docker_setup.sh
COPY start_docker.sh /start_docker.sh

RUN apt-get -y update
RUN apt-get install -qq -y curl
RUN apt-get install -y git \
	python \
	python-pip \
	python3 \
	parallel

RUN pip install numpy \
	--upgrade pip \
	-U textblob \
	nltk \
	--upgrade nltk
RUN python -m textblob.download_corpora
#change this date if you want ot clear cache
ARG CACHE_DATE=2018-4-21
RUN cd ~
RUN git clone https://github.com/wchen38/textblob-performance-analysis.git
RUN cd textblob-performance-analysis
#RUN ls

COPY helloworld.sh /helloworld.sh 
#CMD ["bash","start_docker.sh"]
CMD ["bash","./textblob-performance-analysis/docker/src/run_ocr.sh"]
