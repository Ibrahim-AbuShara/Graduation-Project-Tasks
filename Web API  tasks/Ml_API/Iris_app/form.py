from django import forms
from .models import Iris_in_model

class Iris_Form(forms.ModelForm):
    class Meta:
        model = Iris_in_model
        fields = '__all__'