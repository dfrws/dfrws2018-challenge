FROM log2timeline/plaso

MAINTAINER NIWC-LANT DFRWS Team

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install \
	python-elasticsearch \
	python-setuptools \
	git

RUN git clone --single-branch --branch dfrws2019 https://github.com/infosecjosh/plaso /tmp/plaso
WORKDIR /tmp/plaso
RUN python setup.py install
WORKDIR /home/plaso
ENTRYPOINT ["/usr/local/bin/psort.py"]
