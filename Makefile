tests: install test_select_growth_rates_and_p_values
	shellspec tests/shellspec_tests/

SHELL := /bin/bash

# Enlista phonies
.PHONY: \
		check \
		clean \
		format \
		install \
		test_select_growth_rates_and_p_values \
		tests

module = query_cli
codecov_token = 64470d31-ac2c-4941-a41b-e5db8ade38b0

check:
	black --check --line-length 100 ${module}
	black --check --line-length 100 setup.py
	black --check --line-length 100 tests
	flake8 --max-line-length 100 ${module}
	flake8 --max-line-length 100 setup.py
	flake8 --max-line-length 100 tests

clean:
	rm alacranes_lat_lon_file.csv

format:
	black --line-length 100 ${module}
	black --line-length 100 setup.py
	black --line-length 100 tests

install:
	chmod +x ./src/*
	mkdir --parents /usr/local/bin
	cp --preserve ./src/* /usr/local/bin
	export PATH="/usr/local/bin:$${PATH}"
	pip install . --upgrade

test_select_growth_rates_and_p_values:
	bats tests/bats_tests/test_select_growth_rates_and_p_values.sh
