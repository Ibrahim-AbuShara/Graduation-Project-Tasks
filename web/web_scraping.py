import requests
from bs4 import BeautifulSoup
import csv
from itertools import zip_longest


job_title = []
company_name = []
location_name = []
job_skills = []
links = []
del_links=[]
requirments = []
date = []
page_num=0



while True:
 try:
    result = requests.get(f'https://wuzzuf.net/search/jobs/?a=hpb%7Cspbg&q=python&start={page_num}')
    src = result.content
    soup = BeautifulSoup(src,'lxml')
    

    job_titles = soup.find_all('h2',{'class':'css-m604qf'})
    company_names = soup.find_all('a',{'class':'css-17s97q8'})
    locations_names = soup.find_all('span',{'class':'css-5wys0k'})
    jobs_skills = soup.find_all('div',{'class':'css-y4udm8'})
    date_new = soup.find_all('div',{'class':'css-4c4ojb'})
    date_old = soup.find_all('div',{'class':'css-do6t5g'})
    datee = [*date_new,*date_old]

    for i in range(len(job_titles)):
        job_title.append(job_titles[i].text)
        links.append(job_titles[i].find('a').attrs['href'])
        company_name.append(company_names[i].text)
        location_name.append(locations_names[i].text)
        job_skills.append(jobs_skills[i].text)
        date.append(datee[i].text)
    
    page_num+=1
    print(f'page num {page_num}')
    if page_num > 7 :
        print ('pages finshed')
        break
 except :
    print('Error')
    break

print('\n\n',len(links),'Jobs','\n\n')
j = 1
z=1


# for i in range(len(links)):
#     print(i)
#     print(links[i])

index = 0
for link in links:

        result = requests.get(link)
        src = result.content
        soup = BeautifulSoup(src,'lxml')
        salary = 0
        req = soup.find('div', {'class':'css-1t5f0fr'}).find('ul')
        req_text=''
    
        
        print('-------------{}------------------'.format(j))
        print('-------------{}------------------'.format(index))
        j=j+1
        index=index+1

      
        for li in req.find_all('li'):
            req_text +=li.text + '/ '
        req_text = req_text[:-2]
        requirments.append(req_text) 
    #  print(req_text)
        if j==16:
            print('--------page {}--------'.format(z))
            j=1
            z+=1




lists = [job_title,company_name,location_name,date,job_skills,links,requirments]
export = zip_longest(*lists)
with open('data_1.csv','w',newline='') as befor:
    wri = csv.writer(befor)
    wri.writerow(['Job Title','Company Name','Location Name','Date','Job Skills','Link','Requirments'])
    wri.writerows(export)
  
