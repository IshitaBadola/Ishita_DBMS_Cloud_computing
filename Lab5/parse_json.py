#!usr/bin/env python3
#to read the json file, store the data and parse it to the response

import json
import cgi

# REQUIRED HTTP HEADER
print("Content-Type: text/html\n")

print("<html>")
print("<head><title>Genome List</title></head>")
print("<body>")
print("<h1>Available Genomes</h1>")

# Load the saved JSON file
try:
    with open("/var/www/data/ucscGenome.json", "r") as f:
        data = json.load(f)

    # The genomes are inside the "ucscGenomes" key
    genomes = data.get("ucscGenomes", {})

    genome_dict = {}

    for genome_id, genome_info in genomes.items():
        organism = genome_info.get("organism", "N/A")
        scientific_name = genome_info.get("scientificName", "N/A")

        genome_dict[genome_id] = {
            "organism": organism,
            "scientific_name": scientific_name
        }

    print("<ul>")
    for genome_id, info in genome_dict.items():
        print("<li>")
        print(f"<strong>Genome ID:</strong> {genome_id}<br>")
        print(f"<strong>Organism:</strong> {info['organism']}<br>")
        print(f"<strong>Scientific Name:</strong> {info['scientific_name']}")
        print("</li><br>")
    print("</ul>")

except Exception as e:
    print("<p>Error reading genome file.</p>")
    print(f"<p>{e}</p>")

print("</body>")
print("</html>")