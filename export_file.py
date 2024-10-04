"""

@Author: :pooja
@Date: 2024-10-04 
@Last Modified by: 
@Last Modified time:
@Title : Program to export data from the database.

"""
import pandas as pd
from sqlalchemy import create_engine

# Define the connection string
connection_string = "mssql+pyodbc://LAPTOP-77B90P0P\\SQLEXPRESS/test_db?driver=ODBC+Driver+17+for+SQL+Server"

# Create a SQLAlchemy engine
engine = create_engine(connection_string)

# Query the data into a DataFrame
df = pd.read_sql("SELECT * FROM dbo.produ", engine)

# Save the DataFrame to a CSV file
df.to_csv(r"C:\\Users\\pooja konduri\\OneDrive\\Desktop\\BridgeLabs\\MS-SQL\\pro.csv", index=False)

print("Data exported successfully to pro.csv.")
