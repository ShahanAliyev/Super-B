from django.contrib import admin
from .models import (Category, Brand, Product, ProductVersion,
                    ProductVersionDetail, VersionReview, Size,
                    Color, VersionImage, Discount)



admin.site.register(Brand)
admin.site.register(Product)
admin.site.register(Discount)
admin.site.register(VersionReview)
admin.site.register(Color)
admin.site.register(Size)

# admin.site.register(ProductVersionDetail)
# admin.site.register(ProductVersion)
# admin.site.register(VersionImage)
# admin.site.register(Category)



class ImageInlineAdmin(admin.TabularInline):

    model = VersionImage

class DetailInlineAdmin(admin.TabularInline):

    model = ProductVersionDetail

@admin.register(ProductVersion)
class VersionAdmin(admin.ModelAdmin):
    inlines = (ImageInlineAdmin, DetailInlineAdmin )

@admin.register(Category)
class categoryAdmin(admin.ModelAdmin):

    search_fields = ('name', 'parent',)

# @admin.register(ProductVersionDetail)
# class ProductVersionDetailAdmin(admin.ModelAdmin):

#     search_fields = ('version__product__name', 'version__color__name')
#     list_filter = ('version__product__name', 'version__color__name')

# @admin.register(ProductVersion)
# class ProductVersionAdmin(admin.ModelAdmin):

#     search_fields = ('product__name', 'color', )
#     list_display = ('product__name', 'color', )