"""
La funcion cambia_formato_fecha cambia las fechas de un archivo de datos CSV con 
el formato utilizado en GECI (dd/Mmm/aaaa) a formato ISO-8601 (aaaa-mm-dd).

Sintaxis:
  cambia_formato_fecha [[OPCION] | RUTA]

  OPCION: Alguna de las opciones que se enlistan abajo
  RUTA Ruta del directiorio donde se encuentra el archivo CSV

Opciones:
  -h, --help Despliega este mensaje de ayuda
  -v, --version Muestra la version de cambia_formato_fecha

Ejemplos:
  cambia_formato_fecha <RUTA-DEL-CSV>
  cambia_formato_fecha <RUTA-DEL-CSV> > <RUTA-DEL-ARCHIVO-DONDE-SE-GUARDARAN-LOS-DATOS>

El archivo de prueba tiene las fechas en el formato GECI.

$ head --lines=2 tests/data/test.csv
Fecha,Cantidad_de_trampas_activas,Cantidad_de_avistamientos,Responsable,Notas
15/Jun/2018,4,0,EB,NA

$ cambia_formato_fecha tests/data/test.csv | head --lines=2
Fecha,Cantidad_de_trampas_activas,Cantidad_de_avistamientos,Responsable,Notas
2018-06-15,4,0,EB,NA
"""