export SERIOUS_PYTHON_SITE_PACKAGES := $(PWD)/build/site-packages

flask:
# 	currently for Android
	rm -rf build/site-packages
	rm -rf beeceptor/dist && mkdir -p beeceptor/dist
	dart run serious_python:main package beeceptor/src -p Android --requirements -r,beeceptor/src/requirements.txt --asset beeceptor/dist/beeceptor.zip

run:
	flutter run

build:
	dart run build_runner build

.PHONY: run build flask

# serious_python 筆記: https://www.notion.so/twkevinzhang/build-so-to-Android-154dd3030be3807ba569e2cdead52dbe
