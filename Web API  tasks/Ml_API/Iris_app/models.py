from django.db import models

# Create your models here.

class Iris_in_model(models.Model):
    SepalLengthCm=models.FloatField()
    SepalWidthCm=models.FloatField()
    PetalLengthCm=models.FloatField()
    PetalWidthCm=models.FloatField()
    