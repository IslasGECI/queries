"""
La funcion cambia_formato_fecha bla bla bla
El archivo de prueba tiene las fechas en el formato GECI

$ head --lines=2 tests/data/test.csv
Fecha,Cantidad_de_trampas_activas,Cantidad_de_avistamientos,Responsable,Notas
15/Jun/2018,4,0,EB,NA

$ cambia_formato_fecha tests/data/test.csv | head --lines=2
Fecha,Cantidad_de_trampas_activas,Cantidad_de_avistamientos,Responsable,Notas
2018-06-15,4,0,EB,NA
"""