"""
La funcion cambia_formato_fecha cambia las fechas de un archivo de datos CSV con 
el formato utilizado en GECI a formato ISO-8601.

Tipo      Formato       Ejemplo
GECI      dd/Mmm/aaaa   27/Ago/2020
ISO-8601  aaaa-mm-dd    2020-08-27

Sintaxis:
  cambia_formato_fecha <RUTA>

  RUTA Ruta del directorio donde se encuentra el archivo CSV

El archivo de prueba tiene las fechas en el formato GECI.
Ejemplo de prueba:

$ head tests/data/test.csv
Fecha,Cantidad_de_trampas_activas,Cantidad_de_avistamientos,Responsable,Notas
15/Jun/2018,4,0,EB,NA
30/Ago/2019,21,0,MA y MG,NA
01/Dic/2019,21,0,MA y MG,NA

El archivo de salida tiene las fechas en formato ISO-8601.

Ejemplo de uso:
  $cambia_formato_fecha <RUTA-DEL-CSV>
  $cambia_formato_fecha <RUTA-DEL-CSV> > <RUTA-DEL-ARCHIVO-DONDE-SE-GUARDARAN-LOS-DATOS>

Uso:

$ cambia_formato_fecha tests/data/test.csv
Fecha,Cantidad_de_trampas_activas,Cantidad_de_avistamientos,Responsable,Notas
2018-06-15,4,0,EB,NA
2019-08-30,21,0,MA y MG,NA
2019-12-01,21,0,MA y MG,NA
"""
