# -*- coding: utf-8 -*-
# Generated by Django 1.11.12 on 2018-05-03 13:15
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('companies', '0024_auto_20180502_2347'),
    ]

    operations = [
        migrations.AlterField(
            model_name='messagenode',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='companies.User'),
        ),
    ]