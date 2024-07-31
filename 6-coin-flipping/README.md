# Winning heads streak calculator

A SQL approach to finding the winning streak of Heads coin tosses for a timeseries dataset.

# Requirements
- PostgreSQL
- unix system (only verified on MacOS Sonoma).

# Usage

```bash
./run.sh
```

- Will drop and re-seed the database with the coin toss data
  - note: the import is achieve in two setups for mapping to more approach data types.
- Execute the specified query to find the winning streak.

Instead of `psql`, you may also prefer to modify the query in pgAdmin (db admin tool).

## Sample output

```
You are now connected to database "coin_flipping_db" as user "postgres".
 flipper  | max_streak 
----------+------------
 Abe      |         16
 Jessica  |         13
 Steven   |         10
 Amnon    |         10
 Helen    |          9
 Nandi    |          8
 Lindsay  |          8
 Gavin    |          8
 Reut     |          8
 Kylen    |          7
 Claire   |          7
 Gertrude |          7
 Maryann  |          7
 Megan    |          7
 Pierre   |          7
 Philip   |          6
 Vuli     |          6
 Andrew   |          6
 Henk     |          5
 Illana   |          5
(20 rows)
```
