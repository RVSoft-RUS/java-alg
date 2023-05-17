COPY (
WITH idx_cols AS (
SELECT nsp.nspname AS schemaname
     , ci.relname AS idxname
     , ci.reltuples::bigint
     , ci.relpages
     , coalesce(substring(array_to_string(ci.reloptions, ' ') from 'fillfactor=([0-9]+)')::smallint, 90) AS fillfactor
     , i.indnatts
     , i.indrelid AS tbloid
     , ci.oid AS idxoid
     , CASE WHEN id.indkey = 0 THEN ci.oid ELSE i.indrelid END AS att_rel
     , CASE WHEN id.indkey = 0 THEN id.indnum ELSE id.indkey END AS att_pos
     , ri.relname AS tblname
  FROM pg_class ci
  JOIN pg_index i
    ON i.indexrelid = ci.oid
  JOIN pg_class ri
    ON ri.oid = i.indrelid
  JOIN pg_namespace rnsp
    ON rnsp.oid = ri.relnamespace
  JOIN pg_namespace nsp
    ON nsp.oid = ci.relnamespace
   AND nsp.nspname NOT IN ('pg_toast', 'pg_catalog', 'information_schema')
  JOIN LATERAL unnest(i.indkey) WITH ORDINALITY AS id(indkey, indnum)
    ON (1 = 1)
 WHERE ci.relkind = 'i'
   AND ci.relpages > 0
   AND ci.reltuples > 0
   AND EXISTS (SELECT 1
                 FROM pg_am a
                WHERE a.amname = 'btree'
                  AND a.oid = ci.relam
              )
),
idx_stats AS (
SELECT i.schemaname
     , i.tblname
     , i.idxname
     , i.reltuples
     , i.relpages
     , i.idxoid
     , i.fillfactor
     , current_setting('block_size')::numeric AS bs

     , CASE
         WHEN version() ~ 'mingw32' OR version() ~ '64-bit|x86_64|ppc64|ia64|amd64' THEN 8
         ELSE 4
       END AS maxalign

     , 24 AS pagehdr
     , 16 AS pageopqdata

     , CASE
         WHEN max(coalesce(s.stanullfrac, 0)) = 0 THEN 2
         ELSE 2 + (( 32 + 8 - 1 ) / 8)
       END AS index_tuple_hdr_bm

     , sum( (1 - coalesce(s.stanullfrac, 0)) * coalesce(s.stawidth, 1024)) AS nulldatawidth
     , max( CASE WHEN a.atttypid = 'pg_catalog.name'::regtype THEN 1 ELSE 0 END ) > 0 AS is_na
  FROM idx_cols i
  JOIN pg_attribute a
    ON a.attrelid = i.att_rel
   AND a.attnum = i.att_pos
  JOIN pg_statistic s
    ON s.starelid = i.att_rel
   AND s.staattnum = i.att_pos
 GROUP BY i.schemaname, i.tblname, i.idxname, i.reltuples,
          i.relpages, i.idxoid, i.fillfactor
),
ndw AS (
SELECT i.maxalign
     , i.bs
     , i.schemaname
     , i.tblname
     , i.idxname
     , i.reltuples
     , i.relpages
     , i.idxoid
     , i.fillfactor

     , ( index_tuple_hdr_bm +
                maxalign - CASE -- Add padding to the index tuple header to align on MAXALIGN
                  WHEN index_tuple_hdr_bm%maxalign = 0 THEN maxalign
                  ELSE index_tuple_hdr_bm%maxalign
                END
              + nulldatawidth + maxalign - CASE -- Add padding to the data to align on MAXALIGN
                  WHEN nulldatawidth = 0 THEN 0
                  WHEN nulldatawidth::integer%maxalign = 0 THEN maxalign
                  ELSE nulldatawidth::integer%maxalign
                END
            )::numeric AS nulldatahdrwidth

     , i.pagehdr
     , i.pageopqdata
     , a.idx_scan
     , a.idx_tup_read
     , a.idx_tup_fetch
     , i.is_na
  FROM idx_stats i
  JOIN pg_stat_all_indexes a
    ON a.indexrelid = i.idxoid
),
rp AS (
SELECT coalesce(1 +
         ceil(reltuples/floor((bs-pageopqdata-pagehdr)/(4+nulldatahdrwidth)::float)), 0
      ) AS est_pages

     , coalesce(1 +
         ceil(reltuples/floor((bs-pageopqdata-pagehdr)*fillfactor/(100*(4+nulldatahdrwidth)::float))), 0
       ) AS est_pages_ff

     , bs
     , schemaname
     , tblname
     , idxname
     , relpages
     , reltuples
     , fillfactor
     , idx_scan
     , idx_tup_read
     , idx_tup_fetch
     , is_na
  FROM ndw
)
SELECT schemaname
     , tblname
     , idxname
     , reltuples
     , pg_size_pretty(bs * (relpages)::bigint)  AS real_size_p
     , pg_size_pretty(bs * (relpages - est_pages)::bigint) AS extra_size_p
     , 100 * (relpages - est_pages)::float / relpages AS extra_ratio
     , fillfactor

     , pg_size_pretty(CASE WHEN relpages > est_pages_ff THEN bs * (relpages-est_pages_ff) ELSE 0 END::bigint) AS bloat_size_p
     , 100 * (relpages - est_pages_ff)::float / relpages AS bloat_ratio
     , idx_scan
     , idx_tup_read
     , idx_tup_fetch
     , is_na
  FROM rp
) TO '/tmp/bloated_indexes.csv' (format csv, delimiter ';', ENCODING 'UTF8',header TRUE, FORCE_QUOTE *);