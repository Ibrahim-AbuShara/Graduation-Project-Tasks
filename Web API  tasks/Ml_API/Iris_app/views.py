from django.shortcuts import render ,redirect
from django.urls import reverse
from .form import Iris_Form
import json
import requests
from time import sleep

# Create your views here.
def Iris(request):
 
 if request.method == 'POST':
    form = Iris_Form(request.POST)
    if form.is_valid():
          myform=form.save()
  
     
          dictionary ={
          'SepalLengthCm' : myform.SepalLengthCm,
          'SepalWidthCm' : myform.SepalWidthCm,
          'PetalLengthCm' : myform.PetalLengthCm,
          'PetalWidthCm' : myform.PetalWidthCm,
          'proces_id'    :myform.id,
   
          }#Amira's clown code 
          
          # Serializing json 
          json_object = json.dumps(dictionary, indent = 4)
          print (json_object)
          response = requests.post('http://localhost:8000/api/ml', data= json_object , headers = {"HTTP_HOST": "MyVeryOwnHost",'Content-Type': 'application/json' ,'charset':'utf-8'})
          get=requests.get(f'http://localhost:8000/api/predict/{myform.id}').json()
          return render(request,'Iris_app/index.html',{'get':get,'form':form})

 else:
      form=Iris_Form()
 return render(request,'Iris_app/index.html',{'form':form}) 