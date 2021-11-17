      
        
from django.contrib import admin
from django.urls import path
from django.urls.conf import include
from . import views
app_name='Ires_app'
urlpatterns = [
    
    path('',views.Iris, name='Iris_App'),
    
]