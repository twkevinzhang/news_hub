export PYTHONUNBUFFERED := 1 # for python to print to stdout immediately

.PHONY: install
install:
	pip install grpcio-tools===1.67.1
	pip install -r src/requirements.txt

.PHONY: run
run:
	cd src && python main.py

.PHONY: clean
clean:
	pip freeze | xargs pip uninstall -y

.PHONY: proto
proto:
	python -m grpc_tools.protoc -I../news_hub_protos --python_out=src/downloaded/komica --pyi_out=src/downloaded/komica --grpc_python_out=src/downloaded/komica ../news_hub_protos/*.proto
	python -m grpc_tools.protoc -I../news_hub_protos --python_out=src --pyi_out=src --grpc_python_out=src ../news_hub_protos/*.proto
