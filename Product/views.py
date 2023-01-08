from django.shortcuts import render
from django.views.generic import ListView
from .models import Product, Category, Color, Brand, Size


def product_detail(request):
    return render(request, "product-detail.html")

def quick_view(request):
    return render(request, "quick_view.html")

class ProductListView(ListView):

    model = Product
    template_name = 'product-list.html'
    context_object_name = 'products'
    paginate_by = 1

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['categories'] = Category.objects.all()
        context['colors'] = Color.objects.all()
        context['brands'] = Brand.objects.all()
        context['sizes'] = Size.objects.all()
        return context