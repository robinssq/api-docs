IMAGE_VERSION ?= latest
DIR=$(shell pwd)
SECTION ?= index

HOST_UID = `id -u`
HOST_GID = `id -g`

docker-build:
	docker build -t bamx/api-docs:${IMAGE_VERSION} conf

docker-pull:
	docker pull bamx/api-docs:${IMAGE_VERSION}

docker-pull-latest:
	docker pull bamx/api-docs:latest

docker-push:
	docker push bamx/api-docs:${IMAGE_VERSION}

docker-push-latest:
	docker push bamx/api-docs:latest

docker-tag-latest:
	docker tag bamx/api-docs:${IMAGE_VERSION} bamx/api-docs:latest

# Shortcut for generating sphinx documentation in the most commonly-used formats
docker-sphinx: docker-sphinx-html docker-sphinx-singlehtml

# Run an arbitrary sphinx make target in the docker container. Examples:
#   make docker-sphinx-clean
#   make docker-sphinx-html
docker-sphinx-%:
	docker run -v `pwd`/docs:/opt/bamx/docs --workdir /opt/bamx/docs --rm bamx/api-docs make $*

# Open file for preview in Chrome: make preview SECTION=smartlink
# SECTION: name of the rst file
preview:
	bash -c "open -a Google\ Chrome ${DIR}/docs/_build/html/${SECTION}.html"

docker-ssh:
	docker run -it bamx/api-docs sh

######################################
# Pip Tools
######################################

pip-compile:
	docker run -it -v ${DIR}/conf:/opt/bamx/conf bamx/api-docs pip-compile --rebuild --generate-hashes --output-file conf/requirements.txt conf/unpinned-requirements.txt && chown ${HOST_UID}:${HOST_GID} conf/requirements.txt

pip-upgrade:
	docker run -it -v ${DIR}/conf:/opt/bamx/conf bamx/api-docs pip-compile --upgrade --rebuild --generate-hashes --output-file conf/requirements.txt conf/unpinned-requirements.txt && chown ${HOST_UID}:${HOST_GID} conf/requirements.txt
