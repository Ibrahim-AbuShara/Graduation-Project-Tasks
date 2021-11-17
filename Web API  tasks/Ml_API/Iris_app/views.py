from django.shortcuts import render ,redirect
from django.urls import reverse
from .form import Iris_Form
# Create your views here.
def Iris(request):
 
 if request.method == 'POST':
    form = Iris_Form(request.POST)
    if form.is_valid():
         myform=form.save()
         return redirect (reverse('Iris_app:Iris_App'))

 else:
      form=Iris_Form()
 return render(request,'Iris_app/index.html',{'form':form}) 