# -*- coding: utf-8 -*-
# Generated by Django 1.11.6 on 2018-01-26 18:01
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('companies', '0007_auto_20180126_1606'),
    ]

    operations = [
        migrations.AddField(
            model_name='tiendo',
            name='title',
            field=models.TextField(blank=True),
        ),
    ]
