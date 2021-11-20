from django.db.models import fields
from rest_framework import serializers
from .models import Iris_model,Iris_prediction


class IrisSerializer(serializers.ModelSerializer):
    class Meta:
        fields = '__all__'
        model = Iris_model



class IrisPredticionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Iris_prediction
        fields = '__all__'
       
        
