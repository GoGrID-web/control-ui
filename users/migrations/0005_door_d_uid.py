# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0004_remove_user_nr'),
    ]

    operations = [
        migrations.AddField(
            model_name='door',
            name='d_uid',
            field=models.CharField(default='test', max_length=10),
            preserve_default=False,
        ),
    ]
