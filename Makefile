VERSION=0.2

REPO=eangelou/cslab
FOLDER=memcached

all: docker_build docker_tag docker_login docker_push
	echo "build complete"
.PHONY: all

docker_build:
	docker build --tag=$(REPO):latest --rm $(FOLDER)
.PHONY: docker_build

docker_tag:
#	docker rmi $(REPO):latest
	docker tag  $(REPO):latest $(REPO):v$(VERSION)
.PHONY: docker_tag

docker_login:
	docker login
.PHONY: docker_login

docker_push:
	docker push $(REPO)
.PHONY: docker_push

clean:
	docker rmi `docker images -q`
.PHONY: clean	
