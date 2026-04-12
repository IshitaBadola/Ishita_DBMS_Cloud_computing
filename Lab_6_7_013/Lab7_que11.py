#!/usr/bin/pyhton3
"""Write a Python program using the mysql.connector package. Create a connection to your local
server (take the password if needed from a text file). Use the connector.cursor() object to query
for the student names and display them."""

import mysql.connector

with open("password.txt") as f:
    password = f.read().strip()

connection = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd=password,
    database="library"
)

cursor = connection.cursor()

query = "SELECT student_name FROM student"
cursor.execute(query)
result = cursor.fetchall()
for row in result:
    print(row)