# Generated by Django 4.1.4 on 2022-12-31 08:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Blog', '0006_alter_blogcomment_email_alter_blogcomment_name'),
    ]

    operations = [
        migrations.AlterField(
            model_name='blogcomment',
            name='email',
            field=models.EmailField(max_length=64),
        ),
        migrations.AlterField(
            model_name='blogcomment',
            name='name',
            field=models.CharField(max_length=32),
        ),
    ]
