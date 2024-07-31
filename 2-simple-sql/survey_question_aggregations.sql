\c survey_db

\set lookup_filter 'education'

SELECT
  MIN(descr) AS :lookup_filter,
  COUNT(sdk.lookup),
  string_agg(id::text, ',') AS "id's"
FROM survey_responses AS sr
JOIN survey_demographic_keys AS sdk
ON sr.:lookup_filter = sdk.lookup
GROUP BY sdk.descr
ORDER BY 1
;
