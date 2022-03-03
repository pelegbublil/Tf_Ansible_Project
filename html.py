import csv
from urllib.parse import urlparse

url_list = ["www.google.co.il", "https://www.infosecurity-magazine.com", "https://arya.demo.guardicore.com/",
            "http://github.com/guardicore/monkey"]

domains = []

for each_url in url_list:
    domain_by_url = urlparse(each_url).netloc.join(each_url.split('.')[-2:])
    domains.append({'URL': each_url, 'domain': domain_by_url})

with open('numbers.csv', 'w', newline='') as csvfile:
    fieldnames = ['URL', 'Domain']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    writer.writeheader()
    for row in domains:
        writer.writerow({'URL': row['URL'], 'Domain': row['domain']})



