from django.urls import path, include
from .views import (WishlistApiView, BasketsApiView, BasketApiView,
                    BasketItemsApiView, RetriveUpdateDeleteBasketItemApiView)

urlpatterns = [
    path("wishlists/", WishlistApiView.as_view(), name="wishlist_api"),
    path("baskets/", BasketsApiView.as_view(), name="baskets_api"),
    path("baskets/<int:pk>", BasketApiView.as_view(), name="basket_api"),
    path("basket_items/", BasketItemsApiView.as_view(), name="basket_items_api"),
    path("basket_items/<int:pk>", RetriveUpdateDeleteBasketItemApiView.as_view(), name="basket_item_api"),
]
