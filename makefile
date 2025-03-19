export SERIOUS_PYTHON_SITE_PACKAGES := {{ NEED_TO_SET }}/Projects/news_hub_extensions/twkevinzhang_komica/build/site-packages
export FILES_HOME := /data/user/0/tw.kevinzhang.news_hub/files

.PHONY: run
run:
	fvm flutter run

.PHONY: build
build:
	fvm dart run build_runner build --delete-conflicting-outputs

.PHONY: clean
clean:
	cd android && ./gradlew clean && cd ..
	fvm dart run build_runner clean

.PHONY: proto
proto:
	protoc --dart_out=grpc:lib/app/extension/api/models -Inews_hub_protos news_hub_protos/*.proto

.PHONY: log
log:
	./adb.sh cat $(FILES_HOME)/flet/adapter/dist/komica.log

.PHONY: adapter
adapter:
# 	currently for Android
	rm -rf $(SERIOUS_PYTHON_SITE_PACKAGES)
	rm -rf adapter/dist && mkdir -p adapter/dist
	cp -r {{ NEED_TO_SET }}/Projects/news_hub_extensions/twkevinzhang_komica/src/* {{ NEED_TO_SET }}/Projects/news_hub/adapter/src/extensions/twkevinzhang_komica/
	fvm dart run serious_python:main package adapter/src -p Android --requirements -r,adapter/src/requirements.txt --asset adapter/dist/adapter.zip --verbose
