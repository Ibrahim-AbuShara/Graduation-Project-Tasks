      
        
from django.contrib import admin
from django.urls import path
from django.urls.conf import include
from . import views
app_name='Ires_app'
urlpatterns = [
    
    path('', views.predict, name='prediction_page'),
    path('predict/', views.predict_chances, name='submit_prediction'),
    path('results/', views.view_results, name='results'),
    
]