from django.db import models
from django.contrib.auth import get_user_model
from django.utils.text import slugify
from django.db.models import F, Sum, Avg, Count
User = get_user_model()


class Category(models.Model):

    name = models.CharField(max_length = 32)
    image = models.ImageField(null = True, blank = True, upload_to = 'images/categories')
    parent = models.ForeignKey('self', null = True, blank = True, related_name = 'children', on_delete = models.CASCADE)

    created_at = models.DateTimeField(auto_now_add = True) 
    updated_at = models.DateTimeField(auto_now = True)

    class Meta:

        verbose_name_plural = 'Categories'
        ordering = ['updated_at'] # ? order randomly

    def __str__(self):

        return f"{self.name} {self.parent}" 
    

class Brand(models.Model):

    name = models.CharField(max_length = 32)
    image = models.ImageField(null = True, blank = True, upload_to = 'images/brands')
    admin = models.ForeignKey(User, null = True, blank = True, on_delete = models.CASCADE)  #OneToOne field

    created_at = models.DateTimeField(auto_now_add = True) 
    updated_at = models.DateTimeField(auto_now = True)

    def __str__(self):
        return f"{self.name} {self.id}"


class Product(models.Model):

    name = models.CharField(max_length = 32)
    price = models.DecimalField(max_digits = 5, decimal_places = 2)
    category = models.ForeignKey(Category, on_delete = models.CASCADE, related_name = "products")
    brand = models.ForeignKey(Brand, on_delete = models.CASCADE, related_name = "products")

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

        return f"{self.amount} {self.is_percentage}"


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

    product = models.ForeignKey(Product, on_delete = models.CASCADE, related_name = 'versions') 
    discount = models.ManyToManyField(Discount, blank = True, related_name = "versions")
    sell_price = models.DecimalField(max_digits = 5, decimal_places = 2, blank = True, null = True)
    color = models.ForeignKey(Color, on_delete = models.CASCADE, related_name = 'versions')
    description = models.TextField(default = "There is no description, yet")
    slug = models.SlugField(null = True, blank = True)
    raiting = models.PositiveIntegerField(default = 0)

    created_at = models.DateTimeField(auto_now_add = True) 
    updated_at = models.DateTimeField(auto_now = True)
    
    def __str__(self):
        return f"{self.color} {self.product.name}"
    
    def save(self, *args, **kwargs):
        super(ProductVersion, self).save(*args, **kwargs)
        
        self.slug = slugify(f"{self.product.brand.name}-{self.product.name}-{self.color.name}")

        if self.reviews.count() !=0:
            self.raiting = self.reviews.aggregate(avg=Avg('avarege_rating'))['avg']
            self.reviews.aggregate(sum=Sum('avarege_rating'))['sum']
        else:
            pass
        
        if self.discount.count() == 0:
            self.sell_price  = self.product.price
        else:
            final_price = self.product.price
            for discount in self.discount.all():
                if discount.is_percentage == True:
                    final_price = ((100 - discount.amount) * final_price) / 100
                elif discount.is_percentage == False and final_price > discount.amount:
                    final_price = final_price - discount.amount
                else:
                    final_price
                     
            self.sell_price = final_price
                
        super(ProductVersion, self).save(*args, **kwargs)



class ProductVersionDetail(models.Model):

    version = models.ForeignKey(ProductVersion, on_delete = models.CASCADE, related_name = "details")
    size = models.ForeignKey(Size, on_delete = models.CASCADE, related_name = "details")
    count = models.PositiveIntegerField()

    created_at = models.DateTimeField(auto_now_add = True) 
    updated_at = models.DateTimeField(auto_now = True)

    def __str__(self):

        return f"{self.version.color.name} {self.version.product.name}'s details {self.size.name} {self.count}"



class VersionImage(models.Model):

    version = models.ForeignKey(ProductVersion, on_delete = models.CASCADE, related_name = "images")
    image = models.ImageField(null = True, blank = True, upload_to = 'images/VersionImages')
    is_cover = models.BooleanField(default = False)

    created_at = models.DateTimeField(auto_now_add = True) 
    updated_at = models.DateTimeField(auto_now = True)

    def __str__(self):

        return f"{self.version.color.name} {self.version.product.name}'s image {self.id}"



class VersionReview(models.Model):

    VERSION_RAITING = [
        (1, 20),
        (2, 40),
        (3, 60),
        (4, 80),
        (5, 100),
    ]

    value = models.PositiveIntegerField(choices = VERSION_RAITING, default = 0)
    price = models.PositiveIntegerField(choices = VERSION_RAITING, default = 0)
    quality = models.PositiveIntegerField(choices = VERSION_RAITING, default = 0)
    summary = models.CharField(max_length = 64)
    review = models.TextField()
    version = models.ForeignKey(ProductVersion, on_delete = models.CASCADE, related_name = "reviews")
    avarege_rating = models.FloatField(default = 0, blank = True, null = True)
    user = models.ForeignKey(User, on_delete = models.CASCADE, related_name = 'reviews')

    created_at = models.DateTimeField(auto_now_add = True) 
    updated_at = models.DateTimeField(auto_now = True)

    def __str__(self):
        return f"{self.user.username}'s review {self.id} to { self.version }"

    def save(self, *args, **kwargs):
        
        self.avarege_rating = ((self.price + self.value + self.quality)*20)/3
        super(VersionReview, self).save(*args, **kwargs)
        self.version.save()

