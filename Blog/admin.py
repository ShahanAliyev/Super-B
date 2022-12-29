from django.contrib import admin
from .models import BlogCategory, Blog, BlogComment

admin.site.register(BlogCategory)
# admin.site.register(Blog)
# admin.site.register(BlogComment)


@admin.register(Blog)
class BlogAdmin(admin.ModelAdmin):

    search_fields = ('header', 'user__username', 'category__name')


@admin.register(BlogComment)
class BlogCommentAdmin(admin.ModelAdmin):

    search_fields = ('name', 'blog__header')