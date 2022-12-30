from django.db import models
from django.contrib.auth import get_user_model

User = get_user_model()


class BlogCategory(models.Model):

    name = models.CharField(max_length = 32)
    image = models.ImageField(null = True, blank = True, upload_to = 'images/blog_categories')

    created_at = models.DateTimeField(auto_now_add = True) 
    updated_at = models.DateTimeField(auto_now = True)

    class Meta:

        verbose_name_plural = 'Blog Categories'
        ordering = ['updated_at'] # ? order randomly

    def __str__(self):

        return f"{self.name} {self.id}" 


class Blog(models.Model):

    header = models.CharField(max_length = 64)
    image = models.ImageField(null = True, blank = True, upload_to = 'media/images/blogs')
    description = models.TextField() # rich text field
    user = models.ForeignKey(User, on_delete = models.CASCADE, related_name = 'blog')
    category = models.ForeignKey(BlogCategory, on_delete = models.CASCADE, related_name = 'blog')
    read_count = models.PositiveIntegerField(default = 0)

    created_at = models.DateTimeField(auto_now_add = True) 
    updated_at = models.DateTimeField(auto_now = True)

    def __str__(self):

        return f"{self.user.username}'s blog - {self.header}"


class BlogComment(models.Model):

    name = models.CharField(max_length = 32)
    email = models.EmailField(max_length = 64)
    comment = models.TextField() # rich text field
    blog = models.ForeignKey(Blog, on_delete = models.CASCADE, related_name = 'comment', null = True, blank = True)
    user = models.ForeignKey(User, related_name = 'blog_comment', on_delete = models.CASCADE, null = True, blank = True)

    created_at = models.DateTimeField(auto_now_add = True) 
    updated_at = models.DateTimeField(auto_now = True)

    def __str__(self):

        return f"{self.name}'s comment to {self.id}"

    
