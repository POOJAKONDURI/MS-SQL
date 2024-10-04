"""
@Author: Pooja
@Date: 2024-10-03
@Last Modified by: Pooja
@Last Modified time:
@Title : Program to perform CRUD operations using MS-SQL connections in python.
"""

import pyodbc
import os
from dotenv import load_dotenv

# Loading from .env file
load_dotenv()

# Fetching server and database details from environment variables
SERVER = os.getenv("SERVER_NAME")
DATABASE = os.getenv("DATABASE_NAME")

def check_connection():
    connection_string = f'DRIVER={{SQL Server}};SERVER={SERVER};DATABASE={DATABASE};Trusted_Connection=yes;'
    conn  = pyodbc.connect(connection_string)
    return conn

def conn_cursor(conn):
    return conn.cursor()

def create_table(conn, cursor):
    cursor.execute('''
        CREATE TABLE Office (
            ID INT PRIMARY KEY,
            Name VARCHAR(100),
            department VARCHAR(50),
            Salary DECIMAL(10, 2)
        )
    ''')
    conn.commit()

def insert_data(conn, cursor):
    query = 'INSERT INTO Office(ID, Name, department, salary) VALUES(?, ?, ?, ?)'
    cursor.execute(query, (1, 'anthony', 'IT', 45000.00))
    conn.commit()

def read_data(cursor):
    query = 'SELECT * FROM Office'
    cursor.execute(query)
    
    rows = cursor.fetchall()
    for row in rows:
        print(f"ID: {row.ID}, Name: {row.Name}, Department: {row.department}, Salary: {row.Salary}")

def update_data(conn, cursor):
    query = 'UPDATE Office SET salary = ? WHERE ID = ?'
    cursor.execute(query, (67000, 1))
    conn.commit()

def delete_data(conn, cursor):
    query = 'DELETE FROM Office WHERE ID = ?'
    cursor.execute(query, (1,))
    conn.commit()

def drop_table(conn, cursor):
    cursor.execute('DROP TABLE Office')
    conn.commit()

def main():
    connection = check_connection()
    print(connection)
    cursor = conn_cursor(connection)
    
    #create_table(connection, cursor)
    #insert_data(connection, cursor)
    
    #print("Data after insertion:")
    #read_data(cursor)
    
    #update_data(connection, cursor)
    
    #print("\nData after update:")
    #read_data(cursor)
    
    #delete_data(connection, cursor)
    
    #read_data(cursor)
    
    #drop_table(connection, cursor)
    #read_data(cursor)
    

    if connection:
        connection.close()

if __name__ == '__main__':
    main()
