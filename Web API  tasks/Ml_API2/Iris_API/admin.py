from django.contrib import admin

# Register your models here.
from .models import  Iris_model,Prediction_model
admin.site.register(Iris_model)
admin.site.register(Prediction_model)


