.PHONY: help
SHELL         := /bin/bash
MAKEFILE_PATH := ./Makefile
MAKEFILES_DIR := ./@bin/makefiles

DOCKER_TAG       := 0.0.1
DOCKER_REPO_NAME := binbash
DOCKER_IMG_NAME  := pyflame-docker-sidecar

help:
	@echo 'Available Commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2}'

#==============================================================#
# INITIALIZATION                                               #
#==============================================================#
init-makefiles: ## initialize makefiles
	rm -rf ${MAKEFILES_DIR}
	mkdir -p ${MAKEFILES_DIR}
	git clone https://github.com/binbashar/le-dev-makefiles.git ${MAKEFILES_DIR}

-include ${MAKEFILES_DIR}/circleci/circleci.mk
-include ${MAKEFILES_DIR}/release-mgmt/release.mk
-include ${MAKEFILES_DIR}/docker/docker-hub-build-push.mk