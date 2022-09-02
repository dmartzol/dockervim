REGISTRY ?= docker.io
NAMESPACE ?= dmartzol
REPOSITORY ?= dockervim
DOCKERVIM_WORKSPACE ?= code

HASH := $(shell git rev-parse HEAD)
SERVER := $(REGISTRY)/$(NAMESPACE)/$(REPOSITORY)
REGORG := $(REGISTRY)/$(NAMESPACE)

.PHONY: build
build:
	docker build -t $(SERVER):latest -t $(SERVER):$(HASH) .

.PHONY: push
push:
	docker push $(SERVER):latest

.PHONY: run
run:
	docker run --rm \
		-v $(HOME)/$(DOCKERVIM_WORKSPACE):/code \
		-it $(SERVER):latest fish

.PHONY: all
all: build push run
