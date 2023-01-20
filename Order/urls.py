from django.urls import path, include
from .views import checkout_billing_info, checkout, shopping_cart, wishlist

urlpatterns = [
    path(
        "checkout_billing_info/",
        checkout_billing_info,
        name="checkout_billing_info",
    ),
    path("checkout/", checkout, name="checkout"),
    path("shopping_cart/", shopping_cart, name="shopping_cart"),
    path("wishlist/", wishlist, name="wishlist"),
    path("api/", include("Order.api.urls")),
]
