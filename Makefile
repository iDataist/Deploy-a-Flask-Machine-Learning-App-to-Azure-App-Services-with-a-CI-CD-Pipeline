setup:
	python3 -m venv ~/.devops

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	#hadolint Dockerfile #uncomment to explore linting Dockerfiles
	pylint --disable=R,C,W1203,W0702 app.py

test:
	python -m pytest -vv --cov=app tests/*.py
	#python -m pytest --nbval notebook.ipynb

all: install lint test
