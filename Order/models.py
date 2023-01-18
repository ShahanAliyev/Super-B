from django.db import models
from django.contrib.auth import get_user_model
from Product.models import ProductVersion, Size

User = get_user_model()


class Basket(models.Model):

    user = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name="basket"
    )
    is_active = models.BooleanField(default=True)
    total_price = models.DecimalField(
        max_digits=6, decimal_places=2, null=True, blank=True
    )

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):

        return f"{self.user.username}'s basket {self.id}"


class BasketItem(models.Model):

    basket = models.ForeignKey(
        Basket, on_delete=models.CASCADE, related_name="items",
        null = True, blank = True
    )
    version = models.ForeignKey(
        ProductVersion, on_delete=models.CASCADE, related_name="items"
    )
    count = models.PositiveIntegerField(default = 1)
    size = models.ForeignKey(Size, null = True, blank = True, on_delete = models.CASCADE)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):

        return f"{self.basket.user.username}'s basket item {self.version.id} {self.id}"


class Wishlist(models.Model):

    user = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name="wishlist",
        null = True, blank = True
    )
    version = models.ForeignKey(
        ProductVersion, on_delete=models.CASCADE, related_name="wishlist"
    )

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):

        return f"{self.user.username}'s wishlit  {self.id}"
