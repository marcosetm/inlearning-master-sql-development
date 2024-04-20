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

    camel_case_pattern = re.compile(r"(?<!^)(?=[A-Z])")
    space_char_pattern = re.compile(r" ")

    database_url = f"postgresql+psycopg2://{user}:{pw}@{host}:{port}/{db}"
    engine = create_engine(database_url)

    for f in filenames:
        df = pd.read_excel(f"../data/{f}")

        # TRANSFORMATIONS
        # update table name from PrefixTableName to no table_name
        remove_prefix = re.sub("Red30Tech", "", f.split(".")[0])
        table_name = camel_case_pattern.sub("_", remove_prefix).lower()

        # update columns from CamelCase to snake_case
        col_names = {}
        for col in df.columns:
            if bool(re.search(space_char_pattern, col)):
                col_names[col] = space_char_pattern.sub("_", col).lower()
            else:    
                col_names[col] = camel_case_pattern.sub("_", col).lower()

        df.rename(columns=col_names, inplace=True)

        # update dates to datetime
        for col in df.columns:
            if re.search(".*date.*", col):
                df[col] = pd.to_datetime(df[col])
            
        # LOAD
        # create table
        df.head(n=0).to_sql(name=table_name, con=engine, if_exists="replace", index=False)

        # insert data
        df.to_sql(name=table_name, con=engine, if_exists="append", index=False)

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
