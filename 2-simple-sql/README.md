# Simple survey results aggregator

A SQL approach to aggregating survey results to questions where the respondent may only select from pre-defined categories

# Requirements
- PostgreSQL
- unix system (only verified on MacOS Sonoma).

# Usage

```bash
./run.sh
```

- Will drop and re-seed the database with the survey results
- Execute the specified query to find id's for a given question

To run the aggregation for other question, simply replace the value of the `lookup_filter`.

Instead of `psql`, you may also prefer to modify the query in pgAdmin (db admin tool).

## Sample output

```
You are now connected to database "survey_db" as user "postgres".
 education | count |                                       id's                                       
-----------+-------+----------------------------------------------------------------------------------
 none      |    23 | 1,2,3,13,14,17,36,38,40,43,46,49,55,59,68,69,71,79,82,86,88,94,97
 primary   |    24 | 11,12,16,20,21,22,23,25,30,33,44,47,52,53,58,63,64,75,78,83,89,90,93,99
 secondary |    28 | 6,7,8,9,15,24,26,28,31,32,34,35,37,51,54,57,60,62,67,73,74,76,77,80,85,96,98,100
 tertiary  |    25 | 4,5,10,18,19,27,29,39,41,42,45,48,50,56,61,65,66,70,72,81,84,87,91,92,95
```

# Limitations

The theoretic limit for the aggregated Id's is 1GB for the text field in PostgreSQL.
The may be working memory limits in place too depending on your setup.
