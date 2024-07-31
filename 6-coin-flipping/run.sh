#!/bin/bash

mkdir -p /tmp/data/
cp ../challenges/coin\ flippling.txt /tmp/data/coin_flipping.txt
cd /tmp/data/
sed -i '' '1d' coin_flipping.txt # remove headers and specify column names explicitly
cd -

psql -U postgres -f db_setup.sql

psql -U postgres -f flipping_streaks.sql
