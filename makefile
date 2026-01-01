export SERIOUS_PYTHON_SITE_PACKAGES := {{ NEED_TO_SET }}/Projects/news_hub_extensions/twkevinzhang_komica/build/site-packages
export FILES_HOME := /data/user/0/tw.kevinzhang.news_hub/files
export SAMPLE_EXTENSION_SOURCE_CODE_PATH := {{ NEED_TO_SET }}/Projects/news_hub/sidecar/src/extensions/twkevinzhang_komica/

.PHONY: run
run:
	flutter run

.PHONY: build
build:
	dart run build_runner build --delete-conflicting-outputs

.PHONY: clean
clean:
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
	./adb.sh cat $(FILES_HOME)/flet/sidecar/dist/komica.log

.PHONY: sidecar
sidecar:
# 	currently for Android
	rm -rf $(SERIOUS_PYTHON_SITE_PACKAGES)
	rm -rf sidecar/dist && mkdir -p sidecar/dist
	rm -rf $(SAMPLE_EXTENSION_SOURCE_CODE_PATH) && mkdir -p $(SAMPLE_EXTENSION_SOURCE_CODE_PATH)
	cp -r {{ NEED_TO_SET }}/Projects/news_hub_extensions/twkevinzhang_komica/src/* $(SAMPLE_EXTENSION_SOURCE_CODE_PATH)
	dart run serious_python:main package sidecar/src -p Android --requirements -r,sidecar/src/requirements.txt --asset sidecar/dist/sidecar.zip --verbose
