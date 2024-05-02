# Ingest Data

Make sure docker compose is running.

[Download the PosgreSQL Demo Database file](https://github.com/ami-levin/LinkedIn/blob/master/Query%20Processing/Demo%20Database/PostgreSQL.sql)

Comment out or remove the `CREATE DATABASE ...` statement in line 8

Connect to PostgreSQL
```
# I use pgcli
pgcli -U username -h localhost
```

Create the database and  connect to it
```
CREATE DATABASE Animal_Shelter;
\c animal_shelter
```

Run the file
```
\i path/to/PostgreSQL.sql
```

