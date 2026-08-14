import pandas as pd
from sqlalchemy import create_engine
import os

# --- EDIT THESE ---
DB_USER = 'postgres'
DB_PASSWORD = '123'
DB_HOST = 'localhost'
DB_PORT = '5432'
DB_NAME = 'Olist database'   # or "Olist database" if you kept the space
CSV_FOLDER = r'C:\Users\aehda\Downloads\archive\project'
# ------------------

engine = create_engine(f'postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}')

for filename in os.listdir(CSV_FOLDER):
    if filename.endswith('.csv'):
        table_name = filename.replace('.csv', '').replace('olist_', '').replace('_dataset', '')
        df = pd.read_csv(os.path.join(CSV_FOLDER, filename))
        df.to_sql(table_name, engine, if_exists='replace', index=False)
        print(f"Loaded {filename} -> table '{table_name}' ({len(df)} rows)")