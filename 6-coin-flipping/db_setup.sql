
DROP DATABASE IF EXISTS coin_flipping_db;

CREATE DATABASE coin_flipping_db;

\connect coin_flipping_db

CREATE TABLE coin_flips (
  id SERIAL PRIMARY KEY,
  flipped_at TIME WITHOUT TIME ZONE,
  flipper VARCHAR(255),
  result BOOLEAN
);

CREATE TABLE coin_flips_staging (
  id SERIAL PRIMARY KEY,
  flipped_at TIME WITHOUT TIME ZONE,
  flipper VARCHAR(255),
  heads_or_tails VARCHAR(2)
);

\copy coin_flips_staging (flipped_at, flipper, heads_or_tails) from '/tmp/data/coin_flipping.txt' delimiter E'\t' CSV HEADER;

INSERT INTO coin_flips (flipped_at, flipper, result)
SELECT 
  flipped_at,
  flipper,
  CASE
      WHEN heads_or_tails = 'H' THEN TRUE
      WHEN heads_or_tails = 'T' THEN FALSE
      ELSE NULL
  END
  result
FROM coin_flips_staging;

DROP TABLE coin_flips_staging;
