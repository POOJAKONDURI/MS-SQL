import pandas as pd
import pyodbc

# Import CSV
data = pd.read_csv(r"C:\\Users\\pooja konduri\\OneDrive\\Desktop\\BridgeLabs\\MS-SQL\\pro.csv")
df = pd.DataFrame(data)

# Connect to SQL Server
conn = pyodbc.connect(
    "Driver={SQL Server};"
    "Server=LAPTOP-77B90P0P\\SQLEXPRESS;"
    "Database=test_db;"
    "Trusted_Connection=yes;"
)
cursor = conn.cursor()

# Create Table
cursor.execute(
    """
    CREATE TABLE produ (
    product_id int primary key,
    product_name nvarchar(50),
    price int
    )
    """
)

# Insert DataFrame to Table
for row in df.itertuples():
    cursor.execute(
        """
        INSERT INTO produ (product_id, product_name, price)
        VALUES (?,?,?)
        """,
        row.product_id,
        row.product_name,
        row.price,
    )
conn.commit()