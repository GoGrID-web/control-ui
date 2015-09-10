from django.db import models

# Create your models here.

class Door(models.Model):
    d_uid = models.CharField(max_length=10)
    name = models.CharField(max_length=20)

    def __unicode__(self):
        return self.name

class User(models.Model):
    code = models.CharField(max_length=11)
    name = models.CharField(max_length=50)
    document = models.CharField(max_length=9)
    door = models.ManyToManyField(Door)

    def __unicode__(self):
        return self.name

    
