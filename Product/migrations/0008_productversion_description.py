# Generated by Django 4.1.4 on 2023-01-09 15:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("Product", "0007_productversion_slug"),
    ]

    operations = [
        migrations.AddField(
            model_name="productversion",
            name="description",
            field=models.TextField(default="There is no description, yet"),
        ),
    ]
