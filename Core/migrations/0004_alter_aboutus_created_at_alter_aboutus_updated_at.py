# Generated by Django 4.1.4 on 2022-12-28 09:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Core', '0003_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='aboutus',
            name='created_at',
            field=models.DateTimeField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='aboutus',
            name='updated_at',
            field=models.DateTimeField(auto_now=True),
        ),
    ]
