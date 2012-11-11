from django.db import models

# Create your models here.

class Billboard(models.Model):
    title = models.CharField(max_length=200)
    # The description to the location
    topography = models.TextField(blank=True)
    # The Longitude
    lon = models.FloatField()
    # The Latitude
    lat = models.FloatField()
    #The GeoManager to work with the geo data
    #objects = models.GeoManager()  
    
    def __unicode__(self):
        return self.title

class Announcement(models.Model):
    billboard = models.ForeignKey(Billboard)
    # The title of the announcement
    title = models.CharField(max_length=200)
    # the main description of the announcement
    #TODO:should we really define a max_length ? 
    body = models.TextField(blank=False)

    def __unicode__(self):
        return self.title