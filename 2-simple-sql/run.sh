#!/bin/bash

mkdir -p /tmp/data/
cp ../challenges/survey_key.txt ../challenges/survey_responses.txt /tmp/data/

psql -U postgres -f db_setup.sql

psql -U postgres -f survey_question_aggregations.sql
