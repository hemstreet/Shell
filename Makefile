# Makefile for configuring Emacs docker containers

# ============================================
# Setup
# ============================================

CONTAINER_NAME?=emacs-hemstreet
CONTAINER_IMAGE?=hemstreet/emacs

PROJECT_ROOT?=$(shell pwd)
EMACS_ROOT?=$(PROJECT_ROOT)/.emacs.d
EMACS_BACKUP?=~/.emacs-backup/$(CONTAINER_NAME)

DOCKER_ROOT?=/mnt/emacs
DOCKER_EMACS_ROOT?=/mnt/.emacs.d
DOCKER_EMACS_BACKUP?=/mnt/.emacs.d.backup

# ============================================
# Tasks
# ============================================

# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help build start

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

build: ## Build emacs container
	docker build -t $(CONTAINER_IMAGE) .

start: ## Start a new emacs docker container
	@echo $(EMACS_ROOT)
	@echo $(DOCKER_EMACS_ROOT)
	docker run --rm \
		-it \
		--name=${CONTAINER_NAME} \
		-e "PROJECT_ROOT=$(DOCKER_ROOT)" \
		-e "EMACS_ROOT=$(DOCKER_EMACS_ROOT)" \
		-e "EMACS_BACKUP=$(DOCKER_EMACS_BACKUP)" \
		-v ${PROJECT_ROOT}:${DOCKER_ROOT} \
	 	-v $(EMACS_ROOT):$(DOCKER_EMACS_ROOT) \
	 	-v $(EMACS_BACKUP):$(DOCKER_EMACS_BACKUP) \
	 	$(CONTAINER_IMAGE)