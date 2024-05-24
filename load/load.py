import os
import gzip
import shutil
import duckdb

# Source and target directories
source_directory = "data/gharchive_sample"
target_dir = "data/unzipped"

files = [file for file in os.listdir(source_directory) if file.endswith(".json.gz")]

def unzip_json_file(json_source, json_dest, filename):
    if filename.endswith(".json.gz"):
        source_file_path = os.path.join(json_source, filename)
        target_file_name = filename[:-3] # Removing the .gz extension from the name
        target_file_path = os.path.join(json_dest, target_file_name)

        # Unzipping the file
        with gzip.open(source_file_path, 'rb') as f_in:
            with open(target_file_path, 'wb') as f_out:
                shutil.copyfileobj(f_in, f_out)

if not os.path.exists(target_dir):
    for file in files:
        unzip_json_file(source_directory, target_dir, file)

con = duckdb.connect(database="github_stars.db")

con.execute("CREATE SCHEMA IF NOT EXISTS source")

json_files = [os.path.join(target_dir, f) for f in os.listdir(target_dir) if f.endswith('.json')]

con.execute(f"""
        CREATE OR REPLACE TABLE source.src_gharchive AS 
        SELECT * FROM read_json_auto('{target_dir}/*.json')
    """)

con.close()