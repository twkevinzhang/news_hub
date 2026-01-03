# Project directories
PROJECT_DIR := $(CURDIR)
ADD_REPO =
ADD_EXTENSION =

# Paths
export SERIOUS_PYTHON_SITE_PACKAGES = $(PROJECT_DIR)/sidecar/build/site-packages
export FILES_HOME := /data/user/0/tw.kevinzhang.news_hub/files

.PHONY: install
install:
	flutter pub get

.PHONY: run
run:
	flutter run

.PHONY: build
build:
	dart run build_runner build --delete-conflicting-outputs

.PHONY: clean
clean:
#   currently for Android
	cd android && ./gradlew clean && cd ..
	dart run build_runner clean

.PHONY: proto
proto:
	protoc --dart_out=grpc:lib/app/service/api/models -Inews_hub_protos news_hub_protos/*.proto
	source sidecar/venv/bin/activate && \
	pip install grpcio-tools===1.67.1 && \
	python -m grpc_tools.protoc -Inews_hub_protos --python_out=sidecar/src --pyi_out=sidecar/src --grpc_python_out=sidecar/src news_hub_protos/*.proto

.PHONY: log
log:
#   currently for Android. Note: log path might need update based on extension
	./adb.sh cat $(FILES_HOME)/flet/sidecar/dist/komica.log

.PHONY: sidecar
sidecar:
	$(MAKE) -C sidecar clean
	$(MAKE) -C sidecar lint
ifeq ($(ADD_REPO)$(ADD_EXTENSION),)
	$(MAKE) -C sidecar merge_requirements
	$(MAKE) -C sidecar prepare_extension
else
	$(MAKE) -C sidecar clone_repo REPO_URL=$(ADD_REPO) EXTENSION=$(ADD_EXTENSION)
	$(MAKE) -C sidecar merge_requirements EXTENSION=$(ADD_EXTENSION)
	$(MAKE) -C sidecar prepare_extension EXTENSION=$(ADD_EXTENSION)
endif
	$(MAKE) -C sidecar lint
#   currently for Android
	dart run serious_python:main package sidecar/src -p Android --requirements -r,sidecar/build/requirements.txt --asset sidecar/dist/sidecar.zip --verbose
