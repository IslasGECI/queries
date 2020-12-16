#!/usr/bin/env bats

@test "select_growth_rates_and_p_values_cormorant" {
  run cat tests/data/output_test_select_growth_rates_and_p_vales.csv
  result="$(./src/select_growth_rates_and_p_values tests/data/cormorant_all_islets_growth_rates.csv p_value "<= 0.1" 1)"
  [ "$output" = "$result" ]
}

@test "select_growth_rates_and_p_values_regional_seabirds" {
  run cat tests/data/output_test_select_growth_rates_and_p_values_regional_seabirds.csv
  result="$(./src/select_growth_rates_and_p_values tests/data/seabirds_all_islets_growth_rates.csv p_value "<= 0.1" 2)"
  [ "$output" = "$result" ]
}

@test "select_growth_rates_and_p_values_seabirds" {
  run cat tests/data/output_test_select_growth_rates_and_p_values_seabirds.csv
  result="$(./src/select_growth_rates_and_p_values tests/data/seabirds_growth_rates.csv p_value "<= 0.1" 3)"
  [ "$output" = "$result" ]
}

