from django.shortcuts import render
from django.views.decorators.cache import never_cache


def checkout_billing_info(request):
    return render(request, "checkout_billing_info.html")


def checkout(request):
    return render(request, "checkout.html")

@never_cache
def shopping_cart(request):
    return render(request, "shopping_cart.html")


def wishlist(request):
    return render(request, "wishlist.html")
