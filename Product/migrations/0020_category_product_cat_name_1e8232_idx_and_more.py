# Generated by Django 4.1.4 on 2023-01-30 08:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("Product", "0019_alter_brand_name_brand_product_bra_name_168660_idx"),
    ]

    operations = [
        migrations.AddIndex(
            model_name="category",
            index=models.Index(fields=["name"], name="Product_cat_name_1e8232_idx"),
        ),
        migrations.AddIndex(
            model_name="product",
            index=models.Index(fields=["name"], name="Product_pro_name_026bf9_idx"),
        ),
    ]
