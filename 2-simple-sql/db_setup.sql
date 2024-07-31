
DROP DATABASE IF EXISTS survey_db;

CREATE DATABASE survey_db;

\connect survey_db

CREATE TABLE survey_responses (
  id SERIAL PRIMARY KEY,
  ageband INTEGER,
  gender INTEGER,
  education INTEGER
);

CREATE TABLE survey_demographic_keys (
  lookup INTEGER PRIMARY KEY,
  descr VARCHAR(255)
);

\copy survey_demographic_keys from '/tmp/data/survey_key.txt' delimiter E'\t' CSV HEADER;
\copy survey_responses from '/tmp/data/survey_responses.txt' delimiter E'\t' CSV HEADER;
