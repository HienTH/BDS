# -*- coding: utf-8 -*-
# Generated by Django 1.11.12 on 2018-05-03 14:09
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('companies', '0027_auto_20180503_1409'),
    ]

    operations = [
        migrations.AlterField(
            model_name='messagenode',
            name='node',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='node', to='companies.Realestatenode'),
        ),
        migrations.AlterField(
            model_name='messagenode',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='companies.User'),
        ),
    ]
