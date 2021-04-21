tests: test_select_growth_rates_and_p_values
	shellspec tests/shellspec_tests/

SHELL := /bin/bash

# Enlista phonies
.PHONY: \
		clean \
		install \
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

test_select_growth_rates_and_p_values:
	bats tests/bats_tests/test_select_growth_rates_and_p_values.sh
