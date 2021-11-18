from django.shortcuts import render ,redirect
from django.urls import reverse
from django.http import JsonResponse
import pandas as pd
from .models import Iris_model


def predict(request):
    return render(request, 'Iris_app/index.html')


def predict_chances(request):

    if request.POST.get('action') == 'post':

        # Receive data from client
        sepal_length = float(request.POST.get('sepal_length'))
        sepal_width = float(request.POST.get('sepal_width'))
        petal_length = float(request.POST.get('petal_length'))
        petal_width = float(request.POST.get('petal_width'))

        # Unpickle model
        model = pd.read_pickle(r"/home/ibrahim/Desktop/projects/Graduation-Project-Tasks/Web API  tasks/Ml_API/new_model.pickle")
        # Make prediction
        result = model.predict([[sepal_length, sepal_width, petal_length, petal_width]])
        print()

        classification = result[0]

        Iris_model.objects.create(sepal_length=sepal_length, sepal_width=sepal_width, petal_length=petal_length,
                                   petal_width=petal_width, classification=classification)

        return JsonResponse({'result': classification, 'sepal_length': sepal_length,
                             'sepal_width': sepal_width, 'petal_length': petal_length, 'petal_width': petal_width},
                            safe=False)

def view_results(request):
    # Submit prediction and show all
    data = {"dataset": Iris_model.objects.all()}
    return render(request, "Iris_app/results.html", data)