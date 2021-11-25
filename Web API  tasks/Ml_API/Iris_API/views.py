from rest_framework import generics
from .models import Iris_model,Iris_prediction
from .serializers import IrisSerializer,IrisPredticionSerializer
from rest_framework.decorators import api_view
from rest_framework.response import Response
import pandas as pd

                 
class IrisList(generics.ListCreateAPIView):
    queryset = Iris_model.objects.all()
    serializer_class = IrisSerializer
    


class IrisDetail(generics.RetrieveDestroyAPIView):
    queryset = Iris_model.objects.all()
    serializer_class = IrisSerializer

    
@api_view(['GET', 'POST'])
def predict_list(request):
    
    if request.method == 'GET':
        predict = Iris_prediction.objects.all()
        serializer = IrisPredticionSerializer(predict,many=True).data
        return Response(serializer)

    elif request.method == 'POST':
        serializer = IrisPredticionSerializer(data=request.data)
        print (type(request.data['SepalLengthCm']))
        # Unpickle model
        model = pd.read_pickle(r"/home/ibrahim/Desktop/projects/Graduation-Project-Tasks/Web API  tasks/Ml_API/new_model.pickle")
        # Make prediction
        result = model.predict([[request.data['SepalLengthCm'], request.data['SepalWidthCm'], request.data['PetalLengthCm'], request.data['PetalWidthCm']]])
        request.data['Species']=result[0]
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)  
@api_view(['GET'])
def get_predict(request,proces_id):
    predict = Iris_prediction.objects.get(proces_id=proces_id)
    serializer = IrisPredticionSerializer(predict).data
    return Response(serializer)     