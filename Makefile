tests: doctests test_cambia_formato_fecha test_dependencies

SHELL := /bin/bash

# Enlista phonies
.PHONY: doctests install test_cambia_formato_fecha test_dependencies tests

test_dependencies:
	pip freeze | grep shelldoctest

test_cambia_formato_fecha: install
	[ $$(tail -1 tests/data/test_2019-2020.csv | cut --characters=1-11) == "01/Dic/2019" ] && \
    [ $$(cambia_formato_fecha tests/data/test_2019-2020.csv | tail -1 | cut --characters=1-10) == "2019-12-01" ]

doctests: install
	shell-doctest test tests/test_cambia_formato_fecha.py | grep "failures" && exit 1 || exit 0
	cambia_formato_fecha --help | grep "$$ cambia_formato_fecha"

# Instala este repo copiando los ejecutables a ~/bin
install:
	mkdir --parents /usr/local/bin
	cp ./src/* /usr/local/bin
	chmod +x /usr/local/bin/*
	export PATH="/usr/local/bin:$${PATH}"
	# Doctest:
	mkdir --parents /usr/local/doctests
	cp ./tests/test_*.py /usr/local/doctests
