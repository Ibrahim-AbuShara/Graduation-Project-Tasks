from django.shortcuts import render ,redirect
from django.urls import reverse
from .form import Iris_Form
import json
import requests


# Create your views here.
def Iris(request):
 
 if request.method == 'POST':
    form = Iris_Form(request.POST)
    if form.is_valid():
          myform=form.save()
  
     
          dictionary ={
          'Sepal Length Cm' : myform.SepalLengthCm,
          'Sepal Width Cm' : myform.SepalWidthCm,
          'Petal Length Cm' : myform.PetalLengthCm,
          'Petal Width Cm' : myform.PetalWidthCm,
   
          }
          
          # Serializing json 
          json_object = json.dumps(dictionary, indent = 4)
          print (type(json_object))


          response = requests.post('https://httpbin.org/post', data= json_object)
          requests.put('https://httpbin.org/put', data = json_object )
          print(response.json)





          return redirect (reverse('Iris_app:Iris_App'))

 else:
      form=Iris_Form()
 return render(request,'Iris_app/index.html',{'form':form}) 