SELECT NULL AS TABLE_CAT
     , n.nspname AS TABLE_SCHEM
     , ct.relname AS TABLE_NAME
     , a.attname AS COLUMN_NAME
     , ik.num AS KEY_SEQ
     , ci.relname AS PK_NAME
  FROM pg_catalog.pg_namespace n
  JOIN pg_catalog.pg_class ct
    ON ct.relnamespace = n.oid
   AND ct.relname = 'databasechangeloglock'
  JOIN pg_catalog.pg_index i
    ON i.indrelid = ct.oid
   AND i.indisprimary
  JOIN pg_catalog.pg_class ci
    ON ci.oid = i.indexrelid
  JOIN unnest(i.indkey) WITH ORDINALITY AS ik(att_num, num)
    ON (1 = 1)
  JOIN pg_catalog.pg_attribute a
    ON a.attrelid = ct.oid
   AND a.attnum = ik.att_num
 WHERE n.nspname = 'cdm'
 ORDER BY table_name, pk_name, key_seq;