from django.shortcuts import render
from django.views.generic import ListView, DetailView
from django.db.models import Q

from .models import (
                    Product,
                    Category, 
                    Color, 
                    Brand, 
                    Size, 
                    ProductVersion)

def product_detail(request):
    return render(request, "product-detail.html")

def quick_view(request):
    return render(request, "quick_view.html")

class ProductListView(ListView):

    model = ProductVersion
    template_name = 'product-list.html'
    context_object_name = 'versions'
    paginate_by = 4

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['parent_categories'] = Category.objects.filter(parent = None)
        context['colors'] = Color.objects.all()
        context['brands'] = Brand.objects.all()
        context['sizes'] = Size.objects.all()
        context['products'] = Product.objects.all()
        
        context['name'] = 'name'
        context['price'] = 'price'
        context['position'] = 'position'

        return context

    def get_queryset(self, *args, **kwargs):

        brand = self.request.GET.get('brand')
        size = self.request.GET.get('size')
        color = self.request.GET.get('color')
        category = self.request.GET.get('category')
        cheap = self.request.GET.get('maxprice')
        expensive = self.request.GET.get('minprice')
        name = self.request.GET.get('name')
        price = self.request.GET.get('price')
        position = self.request.GET.get('position')

        if brand:
            queryset = ProductVersion.objects.filter(product__brand__id = brand)
        elif size:
            queryset = ProductVersion.objects.select_related().filter(details__size__name = size)
        elif color:
            queryset = ProductVersion.objects.filter(color__name = color)
        elif cheap:
            queryset = ProductVersion.objects.filter(sell_price__lte = cheap)
        elif expensive:
            queryset = ProductVersion.objects.filter(sell_price__gte = expensive)
        elif name:
            queryset = ProductVersion.objects.order_by('slug')
            print(queryset)
        elif price:
            queryset = ProductVersion.objects.order_by('sell_price')
            print(queryset)
        elif position:
            queryset = ProductVersion.objects.all()
            print(queryset)
        elif category:
            queryset = ProductVersion.objects.filter(Q(product__category__name = category) | Q(product__category__parent__name = category) | Q(product__category__parent__parent__name = category))
        else:
            queryset = ProductVersion.objects.all()
        return queryset

class ProductDetailView(DetailView):

    template_name = 'product-detail.html'
    model = ProductVersion

    def get_context_data(self, **kwargs):

        context = super().get_context_data(**kwargs)
        slug = self.kwargs.get(self.slug_url_kwarg)
        version = ProductVersion.objects.filter(slug=slug).first()
        context['version'] = version
        context['reviews'] = version.reviews.all()
        return context 