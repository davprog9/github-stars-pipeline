import os
import gzip
import shutil
import duckdb
import tempfile

# Source and target directories
source_directory = "data/gharchive_sample"

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

with tempfile.TemporaryDirectory(prefix="unzipped") as tempdir:
    # Unzipping all the files 
    for file in files:
        unzip_json_file(source_directory, tempdir, file)

    # Creating database connection
    con = duckdb.connect(database="github_stars.db")

    con.execute("CREATE SCHEMA IF NOT EXISTS source")

    con.execute(f"""
        CREATE OR REPLACE TABLE source.src_gharchive AS 
        SELECT * FROM read_json_auto('{tempdir}/*.json')
    """)

    con.close()