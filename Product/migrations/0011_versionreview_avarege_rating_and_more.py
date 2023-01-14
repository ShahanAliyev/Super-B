# Generated by Django 4.1.4 on 2023-01-11 07:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("Product", "0010_alter_product_brand_alter_product_category_and_more"),
    ]

    operations = [
        migrations.AddField(
            model_name="versionreview",
            name="avarege_rating",
            field=models.FloatField(default=0),
        ),
        migrations.AlterField(
            model_name="versionreview",
            name="price",
            field=models.PositiveIntegerField(
                choices=[(1, 20), (2, 40), (3, 60), (4, 80), (5, 100)], default=0
            ),
        ),
        migrations.AlterField(
            model_name="versionreview",
            name="quality",
            field=models.PositiveIntegerField(
                choices=[(1, 20), (2, 40), (3, 60), (4, 80), (5, 100)], default=0
            ),
        ),
        migrations.AlterField(
            model_name="versionreview",
            name="value",
            field=models.PositiveIntegerField(
                choices=[(1, 20), (2, 40), (3, 60), (4, 80), (5, 100)], default=0
            ),
        ),
    ]
