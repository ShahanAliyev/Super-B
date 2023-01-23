from django.urls import path, include
from .views import (WishlistApiView, BasketApiView, 
                    BasketItemsApiView, RetriveUpdateDeleteBasketItemApiView)

urlpatterns = [
    path("wishlists/", WishlistApiView.as_view(), name="wishlist_api"),
    path("baskets/", BasketApiView.as_view(), name="basket_api"),
    path("basket_items/", BasketItemsApiView.as_view(), name="basket_items_api"),
    path("basket_items/<int:pk>", RetriveUpdateDeleteBasketItemApiView.as_view(), name="basket_item_api"),
]
