init:
	pip install pipenv --upgrade
	pipenv install --dev

test:
	pipenv run py.test --junitxml=report.xml

flake8:
	pipenv run flake8 src

coverage:
	pipenv run py.test --cov-config .coveragerc --verbose --cov-report term --cov-report xml --cov=aws_okta_processor tests

publish:
	python setup.py sdist bdist_wheel
	twine check dist/*
	twine upload dist/*
	rm -fr build dist .egg requests.egg-info
