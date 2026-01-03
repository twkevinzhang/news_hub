export PYTHONUNBUFFERED := 1 # for python to print to stdout immediately

.PHONY: install
install:
	pip install grpcio-tools===1.67.1
	pip install -r requirements.txt

.PHONY: run
run:
	cd src && python main.py

.PHONY: proto
proto:
	python -m grpc_tools.protoc -I../news_hub_protos --python_out=src --pyi_out=src --grpc_python_out=src ../news_hub_protos/*.proto

.PHONY: lint
lint:
	pip install flake8
	python3 -m flake8 src --select=E9,F63,F7,F82 --count
	python3 -m flake8 build --select=E9,F63,F7,F82 --count

REPO_URL =
EXTENSION =

.PHONY: clone_repo
clone_repo:
	@echo "use target dir: build/$(EXTENSION)"
	@echo "use repo url: $(REPO_URL)"
	@if [ ! -d "build/$(EXTENSION)/.git" ]; then \
		mkdir -p $$(dirname build/$(EXTENSION)); \
		git clone $(REPO_URL) build/$(EXTENSION); \
	else \
		echo "dir already exists, updating..."; \
		cd build/$(EXTENSION) && git pull; \
	fi

.PHONY: merge_requirements
merge_requirements:
	@if [ -z "$(EXTENSION)" ]; then \
		echo "merge default requirements.txt"; \
		cp requirements.txt build/requirements.txt; \
	else \
		echo "merge $(EXTENSION) requirements.txt"; \
		cat ./requirements.txt build/$(EXTENSION)/requirements.txt > build/requirements.txt; \
	fi

.PHONY: prepare_extension
prepare_extension:
	@if [ ! -z "$(EXTENSION)" ] && [ -d "build/$(EXTENSION)/src" ]; then \
		echo "Preparing extension source: $(EXTENSION)"; \
		rm -rf src/extensions/$(EXTENSION); \
		mkdir -p src/extensions/$(EXTENSION); \
		cp -r build/$(EXTENSION)/src/* src/extensions/$(EXTENSION)/; \
	fi

.PHONY: clean
clean:
	rm -rf build && mkdir -p build
	rm -rf dist && mkdir -p dist
	rm -rf src/extensions/*
