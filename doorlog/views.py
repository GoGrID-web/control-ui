from django.shortcuts import render
from django.http import HttpResponse
from django.template import RequestContext, loader

from .models import Instance

import os


def index(request):
    entries=[]
    try:
        f = open(os.path.dirname(os.path.abspath(__file__))+"/uks.log")
        entr = [l.split("|") for l in f]
        for e in entr:
            entry="<tr>"
            for i in [0,1,2]:
                entry+="<td>"+e[i]+"</td>"
            entry+="</tr>"
            entries.append(entry)
    except Exception,e:
        entries.append(e)
    template = loader.get_template('doorlog/index.html')
    context = RequestContext(request, {
        'entries': entries,
    })
    return HttpResponse(template.render(context))


