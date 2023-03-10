from django.contrib import admin
from .models import (
    Category,
    Brand,
    Product,
    ProductVersion,
    ProductVersionDetail,
    VersionReview,
    Size,
    Color,
    VersionImage,
    Discount,
)


admin.site.register(Discount)

@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):

    search_fields = ("name",)


@admin.register(Size)
class SizeAdmin(admin.ModelAdmin):

    search_fields = ("name",)


@admin.register(Color)
class ColorAdmin(admin.ModelAdmin):

    search_fields = ("name",)


@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):

    search_fields = (
        "name",
        "brand__name",
    )


@admin.register(Brand)
class BrandAdmin(admin.ModelAdmin):

    search_fields = ("name",)
    readonly_fields = ("admin",)

    def save_model(self, request, obj, form, change):
        obj.admin = request.user
        super().save_model(request, obj, form, change)


class ImageInlineAdmin(admin.TabularInline):

    model = VersionImage


class DetailInlineAdmin(admin.TabularInline):

    model = ProductVersionDetail


@admin.register(ProductVersion)
class VersionAdmin(admin.ModelAdmin):

    search_fields = (
        "color__name",
        "product__name",
    )
    inlines = (ImageInlineAdmin, DetailInlineAdmin)

    def save_related(self, request, form, formsets, change):
                super().save_related(request, form, formsets, change)
                form.instance.save()


@admin.register(ProductVersionDetail)
class ProductVersionDetailAdmin(admin.ModelAdmin):

    search_fields = (
        "version__product__name",
        "version__color__name",
    )
    list_filter = (
        "version__product__name",
        "version__color__name",
    )


@admin.register(VersionReview)
class VersionReviewAdmin(admin.ModelAdmin):

    search_fields = (
        "first_name",
        "last_name",
        "email",
        "version__product__name",
    )
    readonly_fields = ("avarege_rating",)
