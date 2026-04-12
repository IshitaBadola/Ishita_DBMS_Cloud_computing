#!/usr/bin/env python3

import json
import urllib.request

# CRED_FILE="/home/ibab/proxy_creds.txt"
# PROXY="192.168.1.61:3128"
#
# with open(CRED_FILE,"r") as f:
#     username=f.readline().strip()
#     password=f.readline().strip()
#
# user=urllib.parse.quote(username, safe="")
# pwd=urllib.parse.quote(password, safe="")
#
# proxy_url = f"http://{user}:{pwd}@{PROXY}"
# proxy_handler=urllib.request.ProxyHandler({
#     "http": proxy_url,
#     "https": proxy_url
# })
#
# opener = urllib.request.build_opener(proxy_handler)
# urllib.request.install_opener(opener)

API_URL = "https://api.genome.ucsc.edu/list/ucscGenomes"
OUT_FILE = "/var/www/data/ucscGenome.json"

try:
    with urllib.request.urlopen(API_URL) as response:
        raw=response.read().decode("utf-8")
        data=json.loads(raw)
        print(data)

    with open(OUT_FILE, "w") as f:
        json.dump(data, f, indent=2)

    print ("Saved UCSC genome list to", OUT_FILE)

except Exception as e:
    print(e)