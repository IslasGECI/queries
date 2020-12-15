tests: test_cambia_formato_fecha
	bats tests/bats_tests/test_select_growth_rates_and_p_values.sh

SHELL := /bin/bash

define test_doctest
		shell-doctest test $(1) | grep "failures" && exit 1 || exit 0
endef

# Enlista phonies
.PHONY: doctests install test_cambia_formato_fecha tests

test_cambia_formato_fecha: install
	[ $$(tail -1 tests/data/test_2019-2020.csv | cut --characters=1-11) == "01/Dic/2019" ] && \
    [ $$(cambia_formato_fecha tests/data/test_2019-2020.csv | tail -1 | cut --characters=1-10) == "2019-12-01" ]

doctests: install
	pip freeze | grep shelldoctest
	$(call test_doctest, tests/test_cambia_formato_fecha.py)
	cambia_formato_fecha --help | grep "$$ cambia_formato_fecha"
	$(call test_doctest, tests/test_cat_lat_and_lon_files.py)
	$(call test_doctest, tests/test_effort_captures_by_zone.py)

# Instala este repo copiando los ejecutables a ~/bin
install:
	mkdir --parents /usr/local/bin
	cp ./src/* /usr/local/bin
	chmod +x /usr/local/bin/*
	export PATH="/usr/local/bin:$${PATH}"
	# Doctest:
	mkdir --parents /usr/local/doctests
	cp ./tests/test_*.py /usr/local/doctests

clean:
	rm alacranes_lat_lon_file.csv
