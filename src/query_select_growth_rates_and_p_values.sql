SELECT 
  ${columns}
  CASE
    WHEN ${p_value_column} < 0.001
    THEN '$<0.001$'
    ELSE ${p_value_column}
  END 'p-value'
FROM ${table_name}
WHERE ${p_value_column} ${conditional}
