# -*- coding: utf-8 -*-
# Generated by Django 1.11.6 on 2018-02-05 16:51
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('companies', '0017_auto_20180205_1540'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='avatar',
            field=models.TextField(blank=True),
        ),
    ]
