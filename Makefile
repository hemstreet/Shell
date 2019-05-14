# Makefile for configuring Emacs docker containers

# ============================================
# Setup
# ============================================

CONTAINER_NAME?=emacs-hemstreet
CONTAINER_IMAGE?=hemstreet/emacs

PROJECT_DIR?=$(shell pwd)
EMACS_D_DIR?=$(PROJECT_DIR)/.emacs.d
EMACS_BACKUP_DIR?=/emacs-backup/$(CONTAINER_NAME)

DOCKER_PROJECT_DIR?=/root/development
DOCKER_EMACS_DIR?=/root/.emacs.d
DOCKER_EMACS_BACKUP_DIR?=/root/.backup.emacs.d

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
	docker run --rm \
		-it \
		--name=${CONTAINER_NAME} \
		-e "PROJECT_DIR=$(DOCKER_PROJECT_DIR)" \
		-e "EMACS_D_DIR=$(DOCKER_EMACS_DIR)" \
		-e "EMACS_BACKUP_DIR=$(DOCKER_EMACS_BACKUP_DIR)" \
		-v ${PROJECT_DIR}:${DOCKER_PROJECT_DIR} \
	 	-v $(EMACS_D_DIR):$(DOCKER_EMACS_DIR) \
	 	-v $(EMACS_BACKUP_DIR):$(DOCKER_EMACS_BACKUP_DIR) \
	 	$(CONTAINER_IMAGE)

startFresh: # will build and run new version
	$(MAKE) build
	$(MAKE) start