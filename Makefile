CONTAINER_ROOT := /app

SHORT_NAME ?= gutenberg
VERSION ?= 0.4.1
IMAGE_PREFIX ?= jhansen
DEV_REGISTRY ?= quay.io
DEIS_REGISTRY ?= ${DEV_REGISTRY}/
IMAGE := ${DEIS_REGISTRY}${IMAGE_PREFIX}/${SHORT_NAME}:${VERSION}

DOCKER_RUN_CMD := docker run -v $(CURDIR):$(CONTAINER_ROOT) --rm $(IMAGE)
DOCKER_SHELL_CMD := docker run -v $(CURDIR):$(CONTAINER_ROOT) --rm -it $(IMAGE)

DEISIO_SHORT_NAME ?= deisio
DEISIO_VERSION ?= 0.1.0
DEISIO_IMAGE_PREFIX ?= deis
DEISIO_IMAGE := ${DEIS_REGISTRY}${DEISIO_IMAGE_PREFIX}/${DEISIO_SHORT_NAME}:${DEISIO_VERSION}

prep:
	$(DOCKER_RUN_CMD) $(CONTAINER_ROOT)/script/prep

test: prep
	$(DOCKER_RUN_CMD) $(CONTAINER_ROOT)/script/build

build:
	$(DOCKER_RUN_CMD) $(CONTAINER_ROOT)/script/build
	rm -rf rootfs/svc && mv _site rootfs/svc

build-image:
	docker build \
	  --pull \
	  --build-arg BUILD_DATE=`date -u +'%Y-%m-%dT%H:%M:%SZ'` \
	  -t ${DEISIO_IMAGE} rootfs

push:
	docker push ${DEISIO_IMAGE}

shell:
	$(DOCKER_SHELL_CMD) /bin/bash
