from django.db import models

# Create your models here.

class Instance(models.Model):
   time = models.DateTimeField("time")
   level = models.CharField(max_length=10)
   message = models.CharField(max_length=200)

