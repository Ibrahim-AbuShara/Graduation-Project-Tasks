from django.db import models

# Create your models here.
class Iris_model(models.Model):
    id = models.AutoField (primary_key=True)
    SepalLengthCm=models.FloatField()
    SepalWidthCm=models.FloatField()
    PetalLengthCm=models.FloatField()
    PetalWidthCm=models.FloatField()
    Species=models.CharField( max_length=50)
    def __str__(self):
        return self.Species

class Iris_prediction(models.Model):
    id = models.AutoField (primary_key=True)
    SepalLengthCm=models.FloatField()
    SepalWidthCm=models.FloatField()
    PetalLengthCm=models.FloatField()
    PetalWidthCm=models.FloatField()
    Species=models.CharField(max_length=50, null=True, blank=True)
    