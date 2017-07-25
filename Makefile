IMAGE_VERSION ?= latest

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
