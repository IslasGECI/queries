all: tests

SHELL := /bin/bash

# Enlista phonies
.PHONY: doctests install tests

tests: install
	# Prueba cambia_formato_fecha
	[ $$(tail -1 tests/data/test.csv | cut --characters=1-11) == "01/Dic/2019" ] && \
    [ $$(cambia_formato_fecha tests/data/test.csv | tail -1 | cut --characters=1-10) == "2019-12-01" ]
	# Verifica que shelldoctest está instalado
	pip freeze | grep shelldoctest

doctests:
	shell-doctest test tests/test_cambia_formato_fecha.py | grep "failures" && exit 1 || exit 0

# Instala este repo copiando los ejecutables a ~/bin
install:
	mkdir --parents /usr/local/bin
	cp ./src/* /usr/local/bin
	chmod +x /usr/local/bin/*
	export PATH="/usr/local/bin:$${PATH}"
