install: pyproject.toml
	pip install --upgrade pip &&\
	pip install --editable . 
	pip install .[cli] 
	pip install .[api] 
	pip install .[test]
	
lint:
	pylint --disable=R,C src/fs_app/*.py &&\
	pylint --disable=R,C tests/*.py

test:
	python -m pytest -vv --cov=src/fs_app tests

format:
	black src/fs_app/*.py &&\
	black tests/*.py

all:
	install lint format test