# todo
# - download files and clean up name
# - create a database if it does not exist
# - create the tables (name of files without .xlsx) 
# - insert data

import argparse
import glob
from os import path
import pandas as pd
import re
from sqlalchemy import create_engine

def main(params):
    host = params.host
    port = params.port
    user = params.username
    pw = params.password
    db = params.db
    dir = f"{params.dir}"
    ext = f"{params.ext}"
    
    filenames = [path.basename(f) for f in glob.glob(f"{dir}/*.{ext}")] 
    database_url = f"postgresql+psycopg2://{user}:{pw}@{host}:{port}/{db}"
    engine = create_engine(database_url)

    engine.connect()

    for f in filenames:
        table_name =f.split(".")[0]
        df = pd.read_excel(f"../data/{f}", index_col=0)

        for col in df.columns:
            if re.search(".*Date.*", col):
                df[col] = pd.to_datetime(df[col])
    
        df.head(n=0).to_sql(name=table_name, con=engine, if_exists="replace")
        df.to_sql(name=table_name, con=engine, if_exists="append")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Ingest CSV files from a folder.")

    parser.add_argument("--host", help="Hostname for Postgres server.")
    parser.add_argument("--port", help="Port for the host.")
    parser.add_argument("--username", help="Username.")
    parser.add_argument("--password", help="Password")
    parser.add_argument("--db", help="Database name.")
    parser.add_argument("--dir", help="Path to the folder containing CSV files.")
    parser.add_argument("--ext", help="File extension.")

    params = parser.parse_args()

    main(params)
