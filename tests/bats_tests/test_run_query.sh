#!/usr/bin/env bats

@test "run_query" {
  run ./src/run_query tests/data/query_prueba.sql tests/data/test_2019-2020.csv
  [ "$output" = "Temporada,Fecha,Cantidad_de_trampas_activas,Cantidad_de_avistamientos,Responsable,Notas
2019,30/Ago/2019,21,0,MA y MG,NA
2019,01/Dic/2019,21,0,MA y MG,NA" ]
}
