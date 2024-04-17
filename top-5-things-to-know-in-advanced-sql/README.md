# Sandbox

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
    --username postgres \
    --password postgres \
    --db Red30Tech \
    --dir ../data \
    --ext xlsx
```