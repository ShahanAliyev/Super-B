# Generated by Django 4.1.4 on 2022-12-31 07:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Blog', '0004_blogcomment_user'),
    ]

    operations = [
        migrations.AlterField(
            model_name='blogcomment',
            name='email',
            field=models.EmailField(blank=True, max_length=64, null=True),
        ),
        migrations.AlterField(
            model_name='blogcomment',
            name='name',
            field=models.CharField(blank=True, max_length=32, null=True),
        ),
    ]