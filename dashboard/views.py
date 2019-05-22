from django.http import HttpResponse

from django.template import loader


def index(request):
    try:
        template = loader.get_template('dashboard/index.html')
        context = {
            "page_title": "Guaraci - Data Visualization Tool"
        }
        return HttpResponse(template.render(context, request))
    except Exception as e:
        print(e)
        return HttpResponse("we were not able to provide this request")
