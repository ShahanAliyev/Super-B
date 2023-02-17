from django.urls import path, include
from .views import shopping_cart, wishlist, CheckoutView

urlpatterns = [
    path("checkout/", CheckoutView.as_view(), name="checkout"),
    path("shopping_cart/", shopping_cart, name="shopping_cart"),
    path("wishlist/", wishlist, name="wishlist"),
    path("api/", include("Order.api.urls")),
]
