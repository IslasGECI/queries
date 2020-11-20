SELECT 
    SUBSTR($column_name,8,4) ||'-'||
      CASE
        WHEN $column_name LIKE '%Ene%' THEN replace(SUBSTR($column_name,4,3),'Ene','01')
        WHEN $column_name LIKE '%Feb%' THEN replace(SUBSTR($column_name,4,3),'Feb','02')
        WHEN $column_name LIKE '%Mar%' THEN replace(SUBSTR($column_name,4,3),'Mar','03')
        WHEN $column_name LIKE '%Abr%' THEN replace(SUBSTR($column_name,4,3),'Abr','04')
        WHEN $column_name LIKE '%May%' THEN replace(SUBSTR($column_name,4,3),'May','05')
        WHEN $column_name LIKE '%Jun%' THEN replace(SUBSTR($column_name,4,3),'Jun','06')
        WHEN $column_name LIKE '%Jul%' THEN replace(SUBSTR($column_name,4,3),'Jul','07')
        WHEN $column_name LIKE '%Ago%' THEN replace(SUBSTR($column_name,4,3),'Ago','08')
        WHEN $column_name LIKE '%Sep%' THEN replace(SUBSTR($column_name,4,3),'Sep','09')
        WHEN $column_name LIKE '%Oct%' THEN replace(SUBSTR($column_name,4,3),'Oct','10')
        WHEN $column_name LIKE '%Nov%' THEN replace(SUBSTR($column_name,4,3),'Nov','11')
        WHEN $column_name LIKE '%Dic%' THEN replace(SUBSTR($column_name,4,3),'Dic','12')
        ELSE $column_name
      END ||'-'||
    SUBSTR($column_name,1,2) AS Fecha_ISO8601,
    *
FROM '$table_name'