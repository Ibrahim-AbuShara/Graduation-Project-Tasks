from django.contrib import admin

# Register your models here.
'''from .models import  --------
admin.site.register(model)'''

from .models import Iris_model

admin.site.register(Iris_model)