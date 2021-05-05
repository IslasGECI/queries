SELECT 
  SUBSTR(Fecha,8,4) as Temporada,
  *
FROM '${table_name}'
WHERE CAST(SUBSTR(Fecha,8,4) AS INTEGER) > '2018'
