# Generated by Django 4.1.4 on 2023-01-09 09:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("Product", "0005_alter_productversiondetail_size"),
    ]

    operations = [
        migrations.AlterField(
            model_name="productversion",
            name="sell_price",
            field=models.DecimalField(
                blank=True, decimal_places=2, max_digits=5, null=True
            ),
        ),
    ]
