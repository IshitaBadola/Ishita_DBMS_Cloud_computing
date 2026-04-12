#!/usr/bin/env python3

import cgi
import csv
import os

# Print HTTP header
print("Content-Type: text/html; charset=utf-8")
print()  # Blank line required

form = cgi.FieldStorage()
email = form.getvalue("email", "").strip()

csv_file = "registrations.csv"

print("""
<!DOCTYPE html>
<html>
<head>
    <title>Delete User</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        
        .error {
            border-color: red;
        }
        a {
            color: blue;
            text-decoration: none;
        }
    </style>
</head>
<body>
""")

# Check if file exists
if not os.path.exists(csv_file):
    print("<div class='message error'><h2>Error: No registration file found</h2>")
    print("<a href='../formnew.html'>← Back to Form</a></div></body></html>")
else:
    # Read all rows from CSV
    file = open(csv_file, "r")
    reader = csv.reader(file)
    all_rows = list(reader)
    file.close()

    # Filter out the row with matching email
    deleted = False
    new_rows = []

    for i in range(len(all_rows)):
        row = all_rows[i]
        # Keep header (first row) always
        if i == 0:
            new_rows.append(row)
        # For data rows, check if email matches
        elif len(row) > 1 and row[1].strip().lower() == email.lower():
            deleted = True
            # Don't add this row (effectively deleting it)
        else:
            new_rows.append(row)

    # Write back to CSV
    file = open(csv_file, "w", newline="")
    writer = csv.writer(file)
    writer.writerows(new_rows)
    file.close()

    # Show result
    if deleted:
        print(f"<div class='message'><h2>User Deleted Successfully</h2>")
        print(f"<p>User with email <strong>{email}</strong> has been removed.</p>")
    else:
        print(f"<div class='message error'><h2>User Not Found</h2>")
        print(f"<p>No user found with email <strong>{email}</strong>.</p>")

    print("<br><a href='../formnew.html'>← Back to Form</a></div>")

print("</body></html>")