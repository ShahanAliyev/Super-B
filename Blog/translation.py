from modeltranslation.translator import translator, TranslationOptions
from .models import Blog, BlogCategory, BlogComment


class BlogTranslationOptions(TranslationOptions):

    fields = (
        "header",
        "description",
    )


class BlogCategoryTranslationOptions(TranslationOptions):

    fields = ("name",)


class BlogCommentTranslationOptions(TranslationOptions):

    fields = (
        "name",
        "comment",
    )


translator.register(Blog, BlogTranslationOptions)
translator.register(BlogCategory, BlogCategoryTranslationOptions)
translator.register(BlogComment, BlogCommentTranslationOptions)
