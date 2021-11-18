from rest_framework import generics
from .models import Iris_model,Prediction_model
from .serializers import IrisSerializer,predictionSerializer


class IrisList(generics.ListCreateAPIView):
    queryset = Iris_model.objects.all()
    serializer_class = IrisSerializer


class IrisDetail(generics.RetrieveDestroyAPIView):
    queryset = Iris_model.objects.all()
    serializer_class = IrisSerializer

class predict(generics.CreateAPIView):
    queryset=Prediction_model.objects.all()
    serializer_class=IrisSerializer