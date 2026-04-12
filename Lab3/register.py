#!/usr/bin/env python3

import cgi
import cgitb
import csv
import html
from datetime import date
import os

cgitb.enable()  # Enable error display


# Read form data - FieldStorage() reads all form fields sent using POST/GET
form = cgi.FieldStorage()
# getvalue() retrieves the value of each form field
# If the field is missing, an empty string is returned

name = form.getvalue("name", "")
email = form.getvalue("email", "")
#password = form.getvalue("password", "")  # Capturing password (though not storing for security)
category = form.getvalue("category", "")
dob = form.getvalue("dob", "")  # Changed from "date" to "dob" to match HTML
state = form.getvalue("state", "")
comments = html.escape(form.getvalue("comments", ""))

## Get the current date as registration date
reg_date = date.today().isoformat()

print("Content-Type: text/html; charset=utf-8")
print("""
<html>
<body>""")

#OUTPUT MESSAGE AFTER REGISTRATION
print(f"""

<h2>Registration Successful</h2>
<p>
User <b>{name}</b> with email <b>{email}</b> ,
who is a <b>{category}</b>,
has registered for the workshop.
</p>
""")

# CSV file
csv_file = "registrations.csv"   # Name of the CSV file where registration data will be stored
file_exists = os.path.isfile(csv_file)

with open(csv_file, "a", newline="") as file:
    writer = csv.writer(file)   ## Create a CSV writer object

    if not file_exists:         ## If the file is new, write the header row
        writer.writerow([
            "Name", "Email",
            "Category", "DOB", "State",
            "Comments", "Registration Date"
        ])

    writer.writerow([           # Write the user registration details as a new row
        name, email,
        category, dob, state,
        comments, reg_date
    ])

# HTTP header
# Print the HTTP response header
# This tells the browser that the output is HTML
#print("Content-Type: text/html\n\n")

# HTML response
print("""
<!DOCTYPE html>
<html>
<head>
    <title>Registration Successful</title>
</head>
<body>
""")

print(f"""
<h2>Registration Successful</h2>
<p>User {name} has successfully registered for the BioHackathon</p>
<p>User's Email Id is {email}.</p>
<p>The user is a {category}.</p>
<p>The user's date of birth is {dob} and he/she belongs to {state}.</p>

""")

print("</body></html>")
