"""
La funcion cambia_formato_fecha cambia las fechas de un archivo de datos CSV con
el formato utilizado en GECI a formato ISO-8601.

Tipo      Formato       Ejemplo
GECI      dd/Mmm/aaaa   27/Ago/2020
ISO-8601  aaaa-mm-dd    2020-08-27

Sintaxis:
  cambia_formato_fecha <ARCHIVO-DE-ENTRADA>
  cambia_formato_fecha <ARCHIVO-DE-ENTRADA> > <ARCHIVO-DE-SALIDA>

  <ARCHIVO-DE-ENTRADA>  Ruta del directorio donde se encuentra el archivo de 
                        datos orginales CSV
  <ARCHIVO-DE-SALIDA>   Archivo donde se guardan los datos con el formato 
                        ISO-8601

El archivo de datos debe tener las fechas en el formato GECI.
Aqui podemos ver un ejemplo valido de archivo de datos CSV:

$ head tests/data/test.csv
Fecha,Cantidad_de_trampas_activas,Cantidad_de_avistamientos,Responsable,Notas
15/Jun/2018,4,0,EB,NA
30/Ago/2019,21,0,MA y MG,NA
01/Dic/2019,21,0,MA y MG,NA

El archivo de salida tiene las fechas en formato ISO-8601.

Ejemplo de uso:

$ cambia_formato_fecha tests/data/test.csv
Fecha,Cantidad_de_trampas_activas,Cantidad_de_avistamientos,Responsable,Notas
2018-06-15,4,0,EB,NA
2019-08-30,21,0,MA y MG,NA
2019-12-01,21,0,MA y MG,NA
"""
