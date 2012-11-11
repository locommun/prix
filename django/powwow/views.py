from powwow.models import Billboard
from powwow.models import Announcement
from django.shortcuts import render


def index(request):
    
    billboards = Billboard.objects.all
    # template = loader.get_template()
    
    context = {
        'billboards': billboards,
    }
    
    return render(request,'powwow/index.html',context )


def billboard(request, billboard_id):
    
    billboard = Billboard.objects.get(pk=billboard_id)
    
    context = {
        'billboard': billboard,
    }
    return render(request,'powwow/billboard.html',context )


def announcement(request, announcement_id):
        
    announcement = Announcement.objects.get(pk=announcement_id)
    
    context = {
        'announcement': announcement,
    }
    
    return render(request,'powwow/announcement.html',context )

