
from django.urls import path
from .views import IrisList, IrisDetail

app_name = 'Iris_api'

urlpatterns = [
    path('<int:pk>/', IrisDetail.as_view(), name='detailcreate'),
    path('', IrisList.as_view(), name='listcreate'),
]