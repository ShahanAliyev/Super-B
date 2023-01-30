# Generated by Django 4.1.4 on 2023-01-30 07:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("Product", "0018_alter_brand_name"),
    ]

    operations = [
        migrations.AlterField(
            model_name="brand",
            name="name",
            field=models.CharField(max_length=32),
        ),
        migrations.AddIndex(
            model_name="brand",
            index=models.Index(fields=["name"], name="Product_bra_name_168660_idx"),
        ),
    ]
