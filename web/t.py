import requests
from bs4 import BeautifulSoup
import csv
from itertools import zip_longest


salaries = []
page_num=0

result = requests.get('https://wuzzuf.net/jobs/p/Dra0qCSxJsq5-Cyber-Security-Engineer-Cashcall-Cairo-Egypt?o=180&l=sp&t=sj&a=python|search-v3|hpb|spbg')
src = result.content
soup = BeautifulSoup(src,'lxml')
salary = soup.find_all('div', {'class':'css-rcl8e5'})

print (salary[-2].span)

