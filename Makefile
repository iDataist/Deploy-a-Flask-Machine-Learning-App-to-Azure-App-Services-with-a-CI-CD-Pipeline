setup:
	python3 -m venv ~/.devops

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	#hadolint Dockerfile
	pylint --disable=R,C,W1203,W0702 app.py

test:
	python -m pytest -vv --cov=app tests/test_app.py
	#python -m pytest --nbval notebook.ipynb

all: install lint test
