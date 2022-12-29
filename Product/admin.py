from django.contrib import admin
from .models import (Category, Brand, Product, ProductVersion,
                    ProductVersionDetail, VersionReview, Size,
                    Color, VersionImage, Discount)



admin.site.register(Discount)

# admin.site.register(Color)
# admin.site.register(Size)
# admin.site.register(Brand)
# admin.site.register(VersionReview)
# admin.site.register(Product)
# admin.site.register(ProductVersionDetail)
# admin.site.register(ProductVersion)
# admin.site.register(VersionImage)
# admin.site.register(Category)


@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):

    search_fields = ('name', 'parent',)


@admin.register(Size)
class SizeAdmin(admin.ModelAdmin):

    search_fields = ('name', )


@admin.register(Color)
class ColorAdmin(admin.ModelAdmin):

    search_fields = ('name',)


@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):

    search_fields = ('name', 'brand__name',)


@admin.register(Brand)
class BrandAdmin(admin.ModelAdmin):

    search_fields = ('name',)


class ImageInlineAdmin(admin.TabularInline):

    model = VersionImage


class DetailInlineAdmin(admin.TabularInline):

    model = ProductVersionDetail


@admin.register(ProductVersion)
class VersionAdmin(admin.ModelAdmin):

    search_fields = ( 'color__name', 'product__name', )
    inlines = (ImageInlineAdmin, DetailInlineAdmin )


@admin.register(ProductVersionDetail)
class ProductVersionDetailAdmin(admin.ModelAdmin):

    search_fields = ('version__product__name', 'version__color__name',)
    list_filter = ('version__product__name', 'version__color__name',)


@admin.register(VersionReview)
class VersionReviewAdmin(admin.ModelAdmin):

    search_fields = ('first_name', 'last_name', 'email', 'version__product__name',)