# Generated by Django 3.2.6 on 2021-11-18 02:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Iris_API', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='iris_model',
            name='id',
            field=models.IntegerField(primary_key=True, serialize=False),
        ),
    ]