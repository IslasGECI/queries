tests: test_cambia_formato_fecha test_select_growth_rates_and_p_values

SHELL := /bin/bash

define test_doctest
		shell-doctest test $(1) | grep "failures" && exit 1 || exit 0
endef

# Enlista phonies
.PHONY: \
		clean \
		doctests \
		install \
		test_cambia_formato_fecha \
		test_select_growth_rates_and_p_values \
		tests

clean:
	rm alacranes_lat_lon_file.csv

doctests: install
	$(call test_doctest, tests/test_cat_lat_and_lon_files.py)

# Instala este repo copiando los ejecutables a ~/bin
install:
	chmod +x ./src/*
	mkdir --parents /usr/local/bin
	cp --preserve ./src/* /usr/local/bin
	export PATH="/usr/local/bin:$${PATH}"
	# Doctest:
	mkdir --parents /usr/local/doctests
	cp ./tests/test_*.py /usr/local/doctests

test_cambia_formato_fecha: install
	[ $$(tail -1 tests/data/test_2019-2020.csv | cut --characters=1-11) == "01/Dic/2019" ] && \
    [ $$(cambia_formato_fecha tests/data/test_2019-2020.csv | tail -1 | cut --characters=1-10) == "2019-12-01" ]

test_select_growth_rates_and_p_values:
	bats tests/bats_tests/test_select_growth_rates_and_p_values.sh
