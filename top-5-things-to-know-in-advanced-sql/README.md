# Sandbox
>Original lesson uses SQL Server but I wanted to use PostgreSQL.

Runs a PostgreSQL server and pgAdmin to help practice course exercises.

Data downloaded from [course repo](https://github.com/LinkedInLearning/top-5-things-to-know-in-advanced-sql-4403486)

Run Docker Compose
```
cd top-5-things-to-know-in-advanced-sql
docker compose up
```

Run download script
```
python3 ingest_data/download_files.py
```

Run ingest script
```
python3 ingest_from_folder.py \
    --host localhost \
    --port 5432 \
    --username postgres-user \
    --password postgres-pass \
    --db red30tech \
    --dir ../data \
    --ext xlsx
```

Login to pgAdmin and use the [`db_setup.sql`](https://github.com/mrcos-mrtinelli/inlearning-master-sql-development/blob/main/top-5-things-to-know-in-advanced-sql/db_setup.sql) script to update the db.