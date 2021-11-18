# Generated by Django 3.2.9 on 2021-11-17 08:30

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Iris_model',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('SepalLengthCm', models.FloatField()),
                ('SepalWidthCm', models.FloatField()),
                ('PetalLengthCm', models.FloatField()),
                ('PetalWidthCm', models.FloatField()),
                ('Species', models.CharField(max_length=50)),
            ],
        ),
    ]