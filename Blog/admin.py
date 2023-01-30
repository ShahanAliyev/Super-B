from django.contrib import admin
from .models import BlogCategory, Blog, BlogComment
from modeltranslation.admin import TranslationAdmin

# admin.site.register(BlogCategory)
# admin.site.register(Blog)
# admin.site.register(BlogComment)


# @admin.register(BlogCategory)
class BlogCategoryAdmin(TranslationAdmin):
    ...


# @admin.register(Blog)
class BlogAdmin(TranslationAdmin):
    search_fields = ("header", "user__username", "category__name")


# @admin.register(BlogComment)
class BlogCommentAdmin(TranslationAdmin):
    search_fields = ("name", "blog__header")


admin.site.register(Blog, BlogAdmin)
admin.site.register(BlogComment, BlogCommentAdmin)
admin.site.register(BlogCategory, BlogCategoryAdmin)