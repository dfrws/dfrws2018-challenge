
.PHONY: build elastic-start elastic-stop status clean realclean plaso-import

DOCKER=/usr/bin/docker
DOCKER_COMPOSE=/usr/bin/docker-compose
ELASTIC_VERSION=5.2.1
ELASTIC_IP?=172.17.0.1


all: build elastic-start

images: $(DOCKER)
	sudo $(DOCKER) pull docker.elastic.co/elasticsearch/elasticsearch:$(ELASTIC_VERSION)
	sudo $(DOCKER) pull docker.elastic.co/kibana/kibana:$(ELASTIC_VERSION)
	sudo $(DOCKER) pull log2timeline/plaso

build: $(DOCKER)
	sudo $(DOCKER) build -t iot-plaso:latest -f sz-plaso.dockerfile .

elastic-start: $(DOCKER_COMPOSE)
	sudo $(DOCKER_COMPOSE) up -d

elastic-stop: $(DOCKER_COMPOSE)
	sudo $(DOCKER_COMPOSE) down

status: $(DOCKER_COMPOSE)
	sudo $(DOCKER_COMPOSE) ps

clean: $(DOCKER)
	sudo $(DOCKER) ps -aqf status=exited | xargs -r sudo $(DOCKER) rm

realclean: clean
	sudo $(DOCKER) volume rm docker_esdata1

plaso-import: build
	if [ -e /cases/dfrws-plaso.db ]; then rm /cases/dfrws-plaso.db; fi
	cp dfrws-plaso.db /cases/dfrws-plaso.db
	@echo Default elastic password is 'changeme'
	sudo $(DOCKER) run -ti --rm -v /cases:/cases --network docker_esnet iot-plaso:latest -z Europe/Zurich -o elastic --raw_fields --index_name dfrws2019 --server $(ELASTIC_IP) --elastic_user elastic /cases/dfrws2019/dfrws-plaso.db

$(DOCKER):
	sudo apt-get update
	sudo apt-get install -y docker

$(DOCKER_COMPOSE):
	sudo apt-get update
	sudo apt-get install -y docker-compose
