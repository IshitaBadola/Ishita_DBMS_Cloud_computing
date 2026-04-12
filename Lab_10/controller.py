#!/usr/bin/python3

import mysql.connector
import cgi
import cgitb

cgitb.enable()

# -------------------- DATABASE CONNECTION --------------------
# with open("/var/www/html/password.txt") as f:
#     password = f.read().strip()

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="Ishitabadola@16",
    database="ensembl_local",
    ssl_disabled = True
)

cursor = conn.cursor()

# -------------------- QUERY 1: GENE DETAILS --------------------
def gene_details(stable_id):
    query = """
    SELECT *
    FROM gene
    WHERE stable_id = %s;
    """
    cursor.execute(query, (stable_id,))
    results = cursor.fetchall()

    print(f"<h3>Gene Details for {stable_id}</h3>")
    if len(results) == 0:
        print("<p>No Gene Details found</p>")
    else:
        for r in results:
            print(f"<p>{r}</p>")

# -------------------- QUERY 2: TRANSCRIPTS --------------------
def get_transcript(stable_id):
    query = """
    SELECT *
    FROM transcript t
    JOIN gene g ON t.gene_id = g.gene_id
    WHERE g.stable_id = %s;
    """
    cursor.execute(query, (stable_id,))
    results = cursor.fetchall()

    print(f"<h3>Transcripts for {stable_id}</h3>")
    if len(results) == 0:
        print("<p>No Transcripts found</p>")
    else:
        for r in results:
            print(f"<p>{r}</p>")

# -------------------- QUERY 3: GENES IN CHROMOSOME --------------------
def get_gene_in_chromo(chrom):
    query = """
    SELECT *
    FROM gene g
    JOIN seq_region s ON g.seq_region_id = s.seq_region_id
    WHERE s.name = %s
    LIMIT 20;
    """
    cursor.execute(query, (chrom,))
    results = cursor.fetchall()

    print(f"<h3>Genes on Chromosome {chrom}</h3>")
    if len(results) == 0:
        print("<p>No Genes found</p>")
    else:
        for r in results:
            print(f"<p>{r}</p>")

# -------------------- MAIN CONTROLLER --------------------
def main():
    print("Content-Type: text/html\n")
    print("<html><body>")

    form = cgi.FieldStorage()
    action = form.getvalue("action")
    stable_id = form.getvalue("gene")
    chrom = form.getvalue("chr")

    # Defaults
    if not stable_id:
        stable_id = "ENSG00000012048"

    if not chrom:
        chrom = "1"

    # Routing
    if action == "gene":
        gene_details(stable_id)
    elif action == "transcripts":
        get_transcript(stable_id)
    elif action == "chromosome":
        get_gene_in_chromo(chrom)
    else:
        gene_details(stable_id)
        get_transcript(stable_id)
        get_gene_in_chromo(chrom)

    print("</body></html>")

    # Close DB safely
    try:
        cursor.close()
        conn.close()
    except:
        pass

# -------------------- SCRIPT ENTRY POINT --------------------
if __name__ == "__main__":
    main()
