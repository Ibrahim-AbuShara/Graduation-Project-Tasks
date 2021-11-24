
from django.urls import path
from .views import IrisList, IrisDetail,predict_list,get_predict

app_name = 'Iris_api'

urlpatterns = [
    path('<int:pk>/', IrisDetail.as_view(), name='detailcreate'),
    path('', IrisList.as_view(), name='listcreate'),
    path('ml', predict_list, name='ml'),
    path('predict/<int:proces_id>',get_predict,name='get_predict'),
    
]