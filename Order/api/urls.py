from django.urls import path, include
from .views import WishlistApiView, BasketApiView, BasketItemApiView

urlpatterns = [
    path("wishlists/", WishlistApiView.as_view(), name="wishlist_api"),
    path("baskets/", BasketApiView.as_view(), name="basket_api"),
    path("basket_items/", BasketItemApiView.as_view(), name="basket_item_api"),
]