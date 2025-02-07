export SERIOUS_PYTHON_SITE_PACKAGES := $(PWD)/build/site-packages

run:
	flutter run

build:
	dart run build_runner build --delete-conflicting-outputs

.PHONY: run build

# serious_python 筆記: https://www.notion.so/twkevinzhang/build-so-to-Android-154dd3030be3807ba569e2cdead52dbe
