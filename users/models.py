from django.db import models

# Create your models here.
class Zone(models.Model):
    name = models.CharField(max_length=10)
    desc = models.CharField(max_length=20)

    def __unicode__(self):
        return self.name

class Door(models.Model):
    d_uid = models.CharField(max_length=10)
    name = models.CharField(max_length=20)
    zone = models.ManyToManyField(Zone)

    def __unicode__(self):
        return self.name

class User(models.Model):
    code = models.CharField(max_length=11)
    name = models.CharField(max_length=50)
    document = models.CharField(max_length=9)
    zone = models.ManyToManyField(Zone)

    def __unicode__(self):
        return self.name

    
