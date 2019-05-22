from django.db import models


class TableInfo(models.Model):
    name = models.CharField(max_length=200)
    relative_path = models.CharField(max_length=300)
    is_ok = models.BooleanField(default=False)