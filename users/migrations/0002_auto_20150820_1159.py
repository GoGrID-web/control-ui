# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='document',
            field=models.CharField(default='test', max_length=9),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='user',
            name='nr',
            field=models.CharField(default=12423423523L, max_length=12),
            preserve_default=False,
        ),
    ]
