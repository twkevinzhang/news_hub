export SERIOUS_PYTHON_SITE_PACKAGES := {{ NEED_TO_SET }}/Projects/news_hub_extensions/twkevinzhang_komica/build/site-packages
export FILES_HOME := /data/user/0/tw.kevinzhang.news_hub/files

.PHONY: run
run:
	fvm flutter run

.PHONY: build
build:
	fvm dart run build_runner build --delete-conflicting-outputs

.PHONY: proto
proto:
	protoc --dart_out=grpc:lib/app/extension/api/models -Inews_hub_protos news_hub_protos/*.proto

.PHONY: log
log:
	./adb.sh cat $(FILES_HOME)/extensions/twkevinzhang_komica/komica.log
