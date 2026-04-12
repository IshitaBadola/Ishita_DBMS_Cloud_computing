#!/usr/bin/env python3
# This script reads user details from the CSV file
# and displays them in the browser

import cgi
import cgitb
import csv
import os
import html

# Enable error reporting in the browser
cgitb.enable()

# CSV file name (same file used in register.py)
csv_file = "registrations.csv"

# Print HTTP header
print("Content-Type: text/html; charset=utf-8")
print()  # Blank line required

# Start HTML output
print("""
<!DOCTYPE html>
<html>
<head>
    <title>Registered Users</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        h2 {
            color: #333;
            text-align: center;
        }
        table {
            border-collapse: collapse;
            width: 95%;
            margin: 20px auto;
            background-color: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        
    </style>
</head>
<body>
<h2>Workshop Registration Records</h2>
""")

# Check if CSV file exists
if os.path.exists(csv_file):
    # Open and read the CSV file
    file = open(csv_file, "r")
    reader = csv.reader(file)

    # Convert reader to list to check if empty
    all_rows = list(reader)

    # Check if file has data
    if len(all_rows) == 0:
        print("""
        <div class="no-data">
            <p>Registration file is empty.</p>
        </div>
        """)
    elif len(all_rows) == 1:
        # Only header, no data rows
        print("""
        <div class="no-data">
            <p>No users registered yet.</p>
        </div>
        """)
    else:
        # File has header and data
        print("<table>")

        # Print header row
        header = all_rows[0]
        print("<tr>")
        for item in header:
            print(f"<th>{html.escape(item)}</th>")
        print("</tr>")

        # Print data rows
        row_count = 0
        for i in range(1, len(all_rows)):
            row = all_rows[i]
            print("<tr>")
            for item in row:
                print(f"<td>{html.escape(item)}</td>")
            print("</tr>")
            row_count += 1

        print("</table>")
        print(f"<p style='text-align: center;'><strong>Total Registrations: {row_count}</strong></p>")

    file.close()
else:
    print("""
    <div class="no-data">
        <p>No registrations found yet.</p>
    </div>
    """)

# # Back link
# print("""
# <div class="back-link">
#     <a href="../formnew.html">← Back to Registration Form</a>
# </div>
# """)

# End HTML
print("""
</body>
</html>
""")