from django.shortcuts import render
from django.views.decorators.cache import never_cache

from django.views.generic import ListView
from User.models import ContactInformation


class CheckoutView(ListView):

    template_name = 'checkout.html'
    model = ContactInformation   
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['billing_address'] = ContactInformation.objects.filter(user = self.request.user, default_billing_address = True).first()
        context['shipping_address'] = ContactInformation.objects.filter(user = self.request.user, default_shipping_address = True).first()
        return context

    
def checkout(request):
    return render(request, "checkout.html")

@never_cache
def shopping_cart(request):
    return render(request, "shopping_cart.html")


def wishlist(request):
    return render(request, "wishlist.html")
