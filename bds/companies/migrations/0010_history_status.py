# -*- coding: utf-8 -*-
# Generated by Django 1.11.6 on 2018-01-31 07:35
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('companies', '0009_phanhoi'),
    ]

    operations = [
        migrations.AddField(
            model_name='history',
            name='status',
            field=models.BooleanField(default=False),
        ),
    ]
