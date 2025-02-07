export SERIOUS_PYTHON_SITE_PACKAGES := /Users/zhangzhenlong/Projects/news_hub_extensions/twkevinzhang_komica/build/site-packages
export PATH := $(PATH):$(HOME)/.pub-cache/bin

run:
	flutter run

build:
	dart run build_runner build --delete-conflicting-outputs

proto:
	protoc --dart_out=grpc:lib/app/extension/models -Inews_hub_protos news_hub_protos/*.proto

.PHONY: run build proto
