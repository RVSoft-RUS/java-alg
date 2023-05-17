COPY (
WITH constants AS (
SELECT current_setting('block_size')::NUMERIC AS bs
     , CASE WHEN SUBSTRING(version(), 12, 3) IN ('8.0','8.1','8.2') THEN 27 ELSE 23 END AS hdr
     , CASE WHEN version() ~ 'mingw32' THEN 8 ELSE 4 END AS ma
),
stats AS (
SELECT s.schemaname
     , s.tablename
     , MAX(c.hdr) AS hdr
     , MAX(c.ma) AS ma
     , MAX(c.bs) AS bs
     , SUM((1 - s.null_frac) * s.avg_width) AS datawidth
     , MAX(s.null_frac) AS max_null_frac
     , MAX(c.hdr) + 1 + (COUNT(*) FILTER(WHERE s.null_frac <> 0)) / 8 AS nullhdr
  FROM constants c
  JOIN pg_stats s
    ON (1 = 1)
 GROUP BY s.schemaname, s.tablename
),
rs AS (
SELECT ma
     , bs
     , schemaname
     , schemaname::regnamespace::oid AS relnamespace
     , tablename
     , (datawidth + (hdr + ma - (CASE WHEN hdr % ma = 0 THEN ma ELSE hdr % ma END)))::NUMERIC AS datahdr
     , (max_null_frac * (nullhdr + ma - (CASE WHEN nullhdr % ma = 0 THEN ma ELSE nullhdr % ma END))) AS nullhdr2
  FROM stats
),
sml AS (
SELECT cc.oid AS relid
     , rs.schemaname
     , rs.tablename
     , cc.reltuples
     , cc.relpages
     , COALESCE(rc.relpages, 0) AS toast_relpages
     , rs.bs
     , CEIL((cc.reltuples * ((rs.datahdr + rs.ma -
                               (CASE WHEN rs.datahdr % rs.ma = 0 THEN rs.ma ELSE rs.datahdr % rs.ma END)
                             ) + rs.nullhdr2 + 4
                            )
             )/(rs.bs - 20::FLOAT)
           ) AS otta
  FROM rs
  JOIN pg_class cc
    ON cc.relname = rs.tablename
   AND cc.relnamespace = rs.relnamespace
  LEFT JOIN pg_class rc
    ON rc.oid = cc.reltoastrelid
),
res AS (
SELECT s.relid
     , s.schemaname
     , s.tablename
     , s.reltuples::BIGINT AS reltuples
     , (s.relpages::BIGINT + s.toast_relpages::BIGINT) * s.bs AS table_size
     , CASE WHEN s.relpages < s.otta THEN 0 ELSE s.bs * (s.relpages - s.otta)::BIGINT END AS wastedbytes
     , pg_size_pretty(CASE WHEN s.relpages < s.otta THEN 0 ELSE s.bs * (s.relpages - s.otta)::BIGINT END) AS wastedbytes_pretty
     , pg_stat_get_tuples_inserted(s.relid) AS n_tup_ins
     , pg_stat_get_tuples_updated(s.relid) AS n_tup_upd
     , pg_stat_get_tuples_deleted(s.relid) AS n_tup_del
     , pg_stat_get_tuples_hot_updated(s.relid) AS n_tup_hot_upd
     , pg_stat_get_live_tuples(s.relid) AS n_live_tup
     , pg_stat_get_dead_tuples(s.relid) AS n_dead_tup
     , pg_stat_get_mod_since_analyze(s.relid) AS n_mod_since_analyze
     , pg_stat_get_last_autovacuum_time(s.relid) AS last_autovacuum
     , pg_stat_get_last_autoanalyze_time(s.relid) AS last_autoanalyze
     , pg_stat_get_autovacuum_count(s.relid) AS autovacuum_count
     , pg_stat_get_autoanalyze_count(s.relid) AS autoanalyze_count
  FROM sml s
)
SELECT r.relid
     , r.schemaname
     , r.tablename
     , r.reltuples
     , pg_size_pretty(r.table_size) AS table_size
     , r.wastedbytes_pretty
     , CASE WHEN r.table_size = 0 THEN 0 ELSE r.wastedbytes / r.table_size::NUMERIC * 100 END AS bloat_ratio
     , r.n_tup_ins
     , r.n_tup_upd
     , r.n_tup_del
     , r.n_tup_hot_upd
     , r.n_live_tup
     , r.n_dead_tup
     , r.n_mod_since_analyze
     , r.wastedbytes
     , r.last_autovacuum
     , r.last_autoanalyze
     , r.autovacuum_count
     , r.autoanalyze_count
     , r.n_tup_ins + r.n_tup_upd + r.n_tup_del AS dml_rows
  FROM res r
) TO '/tmp/bloated_tables.csv' (format csv, delimiter ';', ENCODING 'UTF8',header TRUE, FORCE_QUOTE *);