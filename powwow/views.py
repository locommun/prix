from django.template import Context, loader
from powwow.models import Billboard
from powwow.models import Announcement
from django.http import HttpResponse


def index(request):
    
    billboards = Billboard.objects.all
    template = loader.get_template('powwow/index.html')
    
    context = Context({
        'billboards': billboards,
    })
    
    return HttpResponse(template.render(context))


def billboard(request, billboard_id):
    
    billboard = Billboard.objects.get(pk=billboard_id)
    template = loader.get_template('powwow/billboard.html')
   
    context = Context({
        'billboard': billboard,
    })
    
    return HttpResponse(template.render(context))


def announcement(request, announcement_id):
        
    announcement = Announcement.objects.get(pk=announcement_id)
    template = loader.get_template('powwow/announcement.html')
   
    context = Context({
        'announcement': announcement,
    })
    
    return HttpResponse(template.render(context))

