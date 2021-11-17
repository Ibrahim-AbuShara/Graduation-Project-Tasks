from django.db import models

# Create your models here.

class Iris_in_model(models.Model):
    SepalLengthCm=models.FloatField('Sepal Length Cm')
    SepalWidthCm=models.FloatField('Sepal Width Cm')
    PetalLengthCm=models.FloatField('Petal Length Cm')
    PetalWidthCm=models.FloatField('Petal Width Cm')
    