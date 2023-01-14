# Generated by Django 4.1.4 on 2022-12-30 10:07

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = []

    operations = [
        migrations.CreateModel(
            name="Brand",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("name", models.CharField(max_length=32)),
                (
                    "image",
                    models.ImageField(blank=True, null=True, upload_to="images/brands"),
                ),
                ("created_at", models.DateTimeField(auto_now_add=True)),
                ("updated_at", models.DateTimeField(auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name="Category",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("name", models.CharField(max_length=32)),
                (
                    "image",
                    models.ImageField(
                        blank=True, null=True, upload_to="images/categories"
                    ),
                ),
                ("created_at", models.DateTimeField(auto_now_add=True)),
                ("updated_at", models.DateTimeField(auto_now=True)),
                (
                    "parent",
                    models.ForeignKey(
                        blank=True,
                        null=True,
                        on_delete=django.db.models.deletion.CASCADE,
                        to="Product.category",
                    ),
                ),
            ],
            options={
                "verbose_name_plural": "Categories",
                "ordering": ["updated_at"],
            },
        ),
        migrations.CreateModel(
            name="Color",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("name", models.CharField(max_length=32)),
                ("created_at", models.DateTimeField(auto_now_add=True)),
                ("updated_at", models.DateTimeField(auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name="Discount",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("amount", models.IntegerField()),
                ("is_percentage", models.BooleanField(default=True)),
                ("created_at", models.DateTimeField(auto_now_add=True)),
                ("updated_at", models.DateTimeField(auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name="Product",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("name", models.CharField(max_length=32)),
                ("price", models.DecimalField(decimal_places=2, max_digits=5)),
                ("created_at", models.DateTimeField(auto_now_add=True)),
                ("updated_at", models.DateTimeField(auto_now=True)),
                (
                    "brand",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        related_name="product",
                        to="Product.brand",
                    ),
                ),
                (
                    "category",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        related_name="product",
                        to="Product.category",
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="ProductVersion",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("sell_price", models.DecimalField(decimal_places=2, max_digits=5)),
                ("created_at", models.DateTimeField(auto_now_add=True)),
                ("updated_at", models.DateTimeField(auto_now=True)),
                (
                    "color",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        related_name="version",
                        to="Product.color",
                    ),
                ),
                ("discount", models.ManyToManyField(blank=True, to="Product.discount")),
                (
                    "product",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        related_name="version",
                        to="Product.product",
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="Size",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("name", models.CharField(max_length=32)),
                ("created_at", models.DateTimeField(auto_now_add=True)),
                ("updated_at", models.DateTimeField(auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name="VersionReview",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                (
                    "value",
                    models.PositiveIntegerField(
                        choices=[
                            ("1", "20"),
                            ("2", "40"),
                            ("3", "60"),
                            ("4", "80"),
                            ("5", "100"),
                        ],
                        default=0,
                    ),
                ),
                (
                    "price",
                    models.PositiveIntegerField(
                        choices=[
                            ("1", "20"),
                            ("2", "40"),
                            ("3", "60"),
                            ("4", "80"),
                            ("5", "100"),
                        ],
                        default=0,
                    ),
                ),
                (
                    "quality",
                    models.PositiveIntegerField(
                        choices=[
                            ("1", "20"),
                            ("2", "40"),
                            ("3", "60"),
                            ("4", "80"),
                            ("5", "100"),
                        ],
                        default=0,
                    ),
                ),
                ("first_name", models.CharField(max_length=32)),
                ("last_name", models.CharField(max_length=32)),
                ("email", models.EmailField(max_length=64)),
                ("description", models.TextField()),
                ("created_at", models.DateTimeField(auto_now_add=True)),
                ("updated_at", models.DateTimeField(auto_now=True)),
                (
                    "version",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        related_name="review",
                        to="Product.productversion",
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="VersionImage",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                (
                    "image_url",
                    models.ImageField(
                        blank=True, null=True, upload_to="images/VersionImages"
                    ),
                ),
                ("is_cover", models.BooleanField(default=False)),
                ("created_at", models.DateTimeField(auto_now_add=True)),
                ("updated_at", models.DateTimeField(auto_now=True)),
                (
                    "version",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        related_name="image",
                        to="Product.productversion",
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="ProductVersionDetail",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("count", models.PositiveIntegerField()),
                ("created_at", models.DateTimeField(auto_now_add=True)),
                ("updated_at", models.DateTimeField(auto_now=True)),
                (
                    "size",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        related_name="size",
                        to="Product.size",
                    ),
                ),
                (
                    "version",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        related_name="detail",
                        to="Product.productversion",
                    ),
                ),
            ],
        ),
    ]
