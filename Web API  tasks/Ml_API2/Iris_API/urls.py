
from django.urls import path
from .views import IrisList, IrisDetail,predict

app_name = 'Iris_api'

urlpatterns = [
    path('<int:pk>/', IrisDetail.as_view(), name='detailcreate'),
    path('', IrisList.as_view(), name='listcreate'),
    path('prediction/', predict.as_view(), name='prediction'),
    
]