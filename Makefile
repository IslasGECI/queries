SHELL := /bin/bash

# Enlista phonies
.PHONY: install tests

tests: install
	[ $$(tail -1 tests/data/test.csv | cut --characters=1-11) == "01/Dic/2019" ] && \
    [ $$(cambia_formato_fecha tests/data/test.csv | tail -1 | cut --characters=1-10) == "2019-12-01" ]

# Instala este repo copiando los ejecutables a ~/bin
install:
	mkdir --parents /usr/local/bin
	cp ./src/* /usr/local/bin
	chmod +x /usr/local/bin/*
	export PATH="/usr/local/bin:$${PATH}"
