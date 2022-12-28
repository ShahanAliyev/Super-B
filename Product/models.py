from django.db import models
from django.contrib.auth import get_user_model

User = get_user_model()


class Category(models.Model):

    name = models.CharField(max_length = 32)
    image = models.ImageField(null = True, blank = True, upload_to = 'media/images/categories')
    parent = models.ForeignKey('self', null = True, blank = True, on_delete = models.CASCADE)

    created_at = models.DateTimeField(auto_now_add = True) 
    updated_at = models.DateTimeField(auto_now = True)

    class Meta:

        verbose_name_plural = 'Categories'
        ordering = ['updated_at'] # ? order randomly

    def __str__(self):

        return f"{self.name} {self.id}" 
    

class Brand(models.Model):

    name = models.CharField(max_length = 32)
    image = models.ImageField(null = True, blank = True, upload_to = 'media/images/brands')

    created_at = models.DateTimeField(auto_now_add = True) 
    updated_at = models.DateTimeField(auto_now = True)

    def __str__(self):

        return f"{self.name} {self.id}" 


class Product(models.Model):

    name = models.CharField(max_length = 32)
    price = models.DecimalField(max_digits = 5, decimal_places = 2)
    category = models.ForeignKey(Category, on_delete = models.CASCADE, related_name = "product")
    brand = models.ForeignKey(Brand, on_delete = models.CASCADE, related_name = "product")

    created_at = models.DateTimeField(auto_now_add = True) 
    updated_at = models.DateTimeField(auto_now = True)

    def __str__(self):

        return f"{self.name} {self.id}" 

class Discount(models.Model):

    amount = models.IntegerField()
    is_percentage = models.BooleanField(default = True)

    created_at = models.DateTimeField(auto_now_add = True) 
    updated_at = models.DateTimeField(auto_now = True)

    def __str__(self):

        return f"{self.id}"


class Color(models.Model):

    name = models.CharField(max_length = 32)

    created_at = models.DateTimeField(auto_now_add = True) 
    updated_at = models.DateTimeField(auto_now = True)

    def __str__(self):

        return f"{self.name}"

class Size(models.Model):

    name = models.CharField(max_length = 32)

    created_at = models.DateTimeField(auto_now_add = True) 
    updated_at = models.DateTimeField(auto_now = True)
    
    def __str__(self):

        return f"{self.name}"


class ProductVersion(models.Model):

    product = models.ForeignKey(Product, on_delete = models.CASCADE, related_name = 'version')
    discount = models.ManyToManyField(Discount)
    sell_price = models.DecimalField(max_digits = 5, decimal_places = 2)
    color = models.ForeignKey(Color, on_delete = models.CASCADE, related_name = 'version')

    created_at = models.DateTimeField(auto_now_add = True) 
    updated_at = models.DateTimeField(auto_now = True)
    
    def __str__(self):

        return f"{self.color} {self.product.name}"


class ProductVersionDetail(models.Model):

    version = models.ForeignKey(ProductVersion, on_delete = models.CASCADE, related_name = "detail")
    size = models.ForeignKey(Size, on_delete = models.CASCADE, related_name = "size")
    count = models.PositiveIntegerField()

    created_at = models.DateTimeField(auto_now_add = True) 
    updated_at = models.DateTimeField(auto_now = True)

    def __str__(self):

        return f"{self.version.id}'s details {self.size.name} {self.count}"



class VersionImage(models.Model):

    version = models.ForeignKey(ProductVersion, on_delete = models.CASCADE, related_name = "image")
    image_url = models.ImageField(null = True, blank = True, upload_to = 'media/images/VersionImages')
    is_cover = models.BooleanField(default = False)

    created_at = models.DateTimeField(auto_now_add = True) 
    updated_at = models.DateTimeField(auto_now = True)

    def __str__(self):

        return f"{self.version.id}'s image {self.id}"



class VersionReview(models.Model):

    name = models.CharField(max_length = 32)
    email = models.EmailField(max_length = 64)
    description = models.TextField()
    raiting = models.PositiveIntegerField()
    version = models.ForeignKey(ProductVersion, on_delete = models.CASCADE, related_name = "review")

    created_at = models.DateTimeField(auto_now_add = True) 
    updated_at = models.DateTimeField(auto_now = True)

    def __str__(self):

        return f"{self.name}'s review {self.id}, {self.version.id}"



    



    
    

