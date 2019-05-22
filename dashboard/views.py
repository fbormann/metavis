from django.http import HttpResponse

from django.template import loader


def index(request):
    template = loader.get_template('dashboard/index.html')
    context = {
        "page_title": "Guaraci - Data Visualization Tool"
    }
    return HttpResponse(template.render(context, request))
