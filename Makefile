# Enlista phonies
.PHONY: install tests

tests: install
	cambia_formato_fecha tests/data/test.csv

# Instala este repo copiando los ejecutables a ~/bin
install:
	mkdir --parents /usr/local/bin
	cp ./src/* /usr/local/bin
	chmod +x /usr/local/bin/*
	export PATH="/usr/local/bin:$${PATH}"
