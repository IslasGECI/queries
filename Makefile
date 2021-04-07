tests: test_cambia_formato_fecha test_select_growth_rates_and_p_values test_cat_lat_and_lon_files

SHELL := /bin/bash

# Enlista phonies
.PHONY: \
		clean \
		install \
		test_cambia_formato_fecha \
		test_cat_lat_and_lon_files \
		test_select_growth_rates_and_p_values \
		tests

clean:
	rm alacranes_lat_lon_file.csv

# Instala este repo copiando los ejecutables a ~/bin
install:
	chmod +x ./src/*
	mkdir --parents /usr/local/bin
	cp --preserve ./src/* /usr/local/bin
	export PATH="/usr/local/bin:$${PATH}"

test_cambia_formato_fecha: install
	[ $$(tail -1 tests/data/test_2019-2020.csv | cut --characters=1-11) == "01/Dic/2019" ] && \
	[ $$(cambia_formato_fecha tests/data/test_2019-2020.csv | tail -1 | cut --characters=1-10) == "2019-12-01" ]

test_cat_lat_and_lon_files:
	shellspec spec/cat_lat_and_lon_files_spec.sh

test_select_growth_rates_and_p_values:
	bats tests/bats_tests/test_select_growth_rates_and_p_values.sh
