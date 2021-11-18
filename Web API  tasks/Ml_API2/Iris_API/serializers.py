from rest_framework import serializers
from .models import Iris_model,Prediction_model


class IrisSerializer(serializers.ModelSerializer):
    class Meta:
        fields = '__all__' 
        model = Iris_model
        
class predictionSerializer(serializers.ModelSerializer):
    class Meta:
        fields = '__all__' 
        model = Prediction_model