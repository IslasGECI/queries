#shellcheck shell=sh

Describe "cambia_formato_fecha"
  It "changes dates from GECI format to ISO-8601 format"
    When call cambia_formato_fecha tests/data/test_2019-2020.csv
    The first line of stdout should equal "Fecha,Cantidad_de_trampas_activas,Cantidad_de_avistamientos,Responsable,Notas"
    The second line of stdout should equal "2018-06-15,4,0,EB,NA"
    The third line of stdout should equal "2019-08-30,21,0,MA y MG,NA"
  End
  It "can be called with as a sub-command"
    When call queries cambia-formato-fecha --data_file tests/data/test_2019-2020.csv
    The first line of stdout should equal "Fecha,Cantidad_de_trampas_activas,Cantidad_de_avistamientos,Responsable,Notas"
    The second line of stdout should equal "2018-06-15,4,0,EB,NA"
    The third line of stdout should equal "2019-08-30,21,0,MA y MG,NA"
  End
  It "takes arguments in different order"
    When call queries cambia-formato-fecha --column_name Fecha --data_file tests/data/test_2019-2020.csv
    The first line of stdout should equal "Fecha,Cantidad_de_trampas_activas,Cantidad_de_avistamientos,Responsable,Notas"
    The second line of stdout should equal "2018-06-15,4,0,EB,NA"
    The third line of stdout should equal "2019-08-30,21,0,MA y MG,NA"
  End
  It "is called from different paths"
    When call cd src && queries cambia-formato-fecha --column_name Fecha --data_file ../tests/data/test_2019-2020.csv && cd ..
    The first line of stdout should equal "Fecha,Cantidad_de_trampas_activas,Cantidad_de_avistamientos,Responsable,Notas"
    The second line of stdout should equal "2018-06-15,4,0,EB,NA"
    The third line of stdout should equal "2019-08-30,21,0,MA y MG,NA"
  End
End
