from django.db import models
from django.contrib.auth import get_user_model
from ckeditor.fields import RichTextField
from django.utils.text import slugify
from django.dispatch import receiver
from django.db.models.signals import (
    pre_save,
)

User = get_user_model()


class BlogCategory(models.Model):

    name = models.CharField(max_length=32)  # db_index = True
    image = models.ImageField(null=True, blank=True, upload_to="images/blog_categories")

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:

        verbose_name_plural = "Blog Categories"
        ordering = ["updated_at"]  # ? order randomly
        indexes = [models.Index(fields=["name"])]

    def __str__(self):
        return f"{self.name} {self.id}"


class Blog(models.Model):

    header = models.CharField(max_length=64)
    image = models.ImageField(null=True, blank=True, upload_to="media/images/blogs")
    description = RichTextField(blank=True, null=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="blog")
    category = models.ForeignKey(
        BlogCategory, on_delete=models.CASCADE, related_name="blogs"
    )
    read_count = models.PositiveIntegerField(default=0)
    slug = models.SlugField(null = True, blank = True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.user.username}'s blog - {self.header}"

    class Meta:
        indexes = [models.Index(fields=["header"])]

@receiver(pre_save, sender = Blog)
def blog_pre_save(instance,sender,*args, **kwargs):
    if not instance.slug:
        instance.slug = slugify(instance.header)


# @receiver(post_save, sender = Blog)
# def blog_post_created_handler(sender, instance, created, *args, **kwargs):
#     if created: 
#         print('created')
#     else:
#         print(instance)

# pre_save.connect(blog_post_created_handler, sender = Blog)


class BlogComment(models.Model):

    name = models.CharField(max_length=32)
    email = models.EmailField(max_length=64)
    comment = models.TextField()  # rich text field
    blog = models.ForeignKey(
        Blog,
        on_delete=models.CASCADE,
        related_name="comment",
        null=True,
        blank=True,
    )
    user = models.ForeignKey(
        User,
        related_name="blog_comment",
        on_delete=models.CASCADE,
        null=True,
        blank=True,
    )

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.name}'s comment to {self.id}"

