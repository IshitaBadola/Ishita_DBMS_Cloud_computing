import mysql.connector

import mysql.connector

with open("password.txt") as f:
    password = f.read().strip()

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd=password,
    database="library"
)

cursor = conn.cursor()

# Query to get defaulters (students who have not returned books)
query = """
    SELECT s.student_name, b.book_name, bi.fine
    FROM student s
    INNER JOIN book_issues bi ON s.student_id = bi.student_id
    INNER JOIN books b ON bi.book_id = b.book_id
    WHERE bi.returned_book != 0
    ORDER BY bi.fine DESC;
    """

cursor.execute(query)
results = cursor.fetchall()

if results:
    print("Defaulters (Not returned books):")
    for student_name, book_name, fine in results:
      print(f"Student: {student_name}, Book: {book_name}, Fine: {fine}")
else:
    print("No defaulters found!")

# Close connection
cursor.close()
conn.close()

