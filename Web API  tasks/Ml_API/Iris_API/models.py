from django.db import models

# Create your models here.

from django.db import models

# Create your models here.
class Iris_model(models.Model):
    SepalLengthCm=models.FloatField()
    SepalWidthCm=models.FloatField()
    PetalLengthCm=models.FloatField()
    PetalWidthCm=models.FloatField()
    Species=models.CharField( max_length=50)
    def __str__(self):
        return self.Species