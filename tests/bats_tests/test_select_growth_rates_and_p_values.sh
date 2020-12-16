#!/usr/bin/env bats

@test "select_growth_rates_and_p_values" {
  run cat tests/data/output_test_select_growth_rates_and_p_vales.csv
  result="$(./src/select_growth_rates_and_p_values tests/data/cormorant_all_islets_growth_rates.csv p_value "<= 0.1" 1)"
  [ "$output" = "$result" ]
}
