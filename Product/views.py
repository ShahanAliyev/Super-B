from django.shortcuts import render
from django.views.generic import ListView, DetailView, CreateView
from django.db.models import Q
from .forms import VersionReviewForm
from django.contrib import messages
from django.shortcuts import render, redirect
from .models import Product, Category, Color, Brand, Size, ProductVersion
from django.utils.translation import gettext_lazy as _

from django.core.cache import cache
from django.conf import settings
from django.core.cache.backends.base import DEFAULT_TIMEOUT
from django.views.decorators.cache import never_cache
from django.utils.decorators import method_decorator

CACHE_TTL = getattr(settings, 'CACHE_TTL', DEFAULT_TIMEOUT)


def product_detail(request):
    return render(request, "product-detail.html")


def quick_view(request):
    if 'brand_count' in cache:
        brand_count = cache.get('brand_count')
        print("CACHE")
    else:
        brand_count = Brand.objects.all().count()
        cache.set('brand_count', brand_count, timeout = CACHE_TTL)
        print("NOT CACHE")
    
    context = {
        'brand_count': brand_count
    }

    return render(request, "quick_view.html", context)


class ProductListView(ListView):

    model = ProductVersion
    template_name = "product-list.html"
    context_object_name = "versions"
    paginate_by = 4


    @method_decorator(never_cache)
    def dispatch(self, request, *args,  **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["parent_categories"] = Category.objects.filter(parent=None)
        context["colors"] = Color.objects.all()
        context["brands"] = Brand.objects.all()
        context["sizes"] = Size.objects.all()
        context["products"] = Product.objects.all()
        if 'recently_viewed' in self.request.session:
            products = ProductVersion.objects.filter(pk__in = self.request.session['recently_viewed'])
            recently_viewed = sorted(products,
                key = lambda x: self.request.session['recently_viewed'].index(x.id)
                                     )
            context["recents"] = recently_viewed

        context["name"] = "name"
        context["price"] = "price"
        context["position"] = "position"

        return context

    def get_queryset(self, *args, **kwargs):

        brand = self.request.GET.get("brand")
        size = self.request.GET.get("size")
        color = self.request.GET.get("color")
        category = self.request.GET.get("category")
        cheap = self.request.GET.get("maxprice")
        expensive = self.request.GET.get("minprice")
        name = self.request.GET.get("name")
        price = self.request.GET.get("price")
        position = self.request.GET.get("position")

        if brand:
            queryset = ProductVersion.objects.filter(product__brand__id=brand)
        elif size:
            queryset = ProductVersion.objects.select_related().filter(
                details__size__name=size
            )
        elif color:
            queryset = ProductVersion.objects.filter(color__name=color)
        elif cheap:
            queryset = ProductVersion.objects.filter(sell_price__lte=cheap)
        elif expensive:
            queryset = ProductVersion.objects.filter(sell_price__gte=expensive)
        elif name:
            queryset = ProductVersion.objects.order_by("slug")
            print(queryset)
        elif price:
            queryset = ProductVersion.objects.order_by("sell_price")
            print(queryset)
        elif position:
            queryset = ProductVersion.objects.all()
            print(queryset)
        elif category:
            queryset = ProductVersion.objects.filter(
                Q(product__category__name=category)
                | Q(product__category__parent__name=category)
                | Q(product__category__parent__parent__name=category)
            )
        else:
            queryset = ProductVersion.objects.all()
        return queryset


class ProductDetailView(DetailView, CreateView):

    template_name = "product-detail.html"
    model = ProductVersion
    form_class = VersionReviewForm

    def get(self, request,*args, **kwargs):
        slug = self.kwargs.get(self.slug_url_kwarg)
        version = ProductVersion.objects.filter(slug=slug).first()

        if 'recently_viewed' in self.request.session:
            if version.id in self.request.session['recently_viewed']:
                self.request.session['recently_viewed'].remove(version.id)
            self.request.session['recently_viewed'].insert(0,version.id)
            if len(self.request.session['recently_viewed']) > 5:
                self.request.session['recently_viewed'].pop()
        else:
            self.request.session['recently_viewed'] = [version.id]
        
        self.request.session.modified = True

        return super().get(request, *args, **kwargs)

    def get_context_data(self, **kwargs):

        context = super().get_context_data(**kwargs)
        slug = self.kwargs.get(self.slug_url_kwarg)
        version = ProductVersion.objects.filter(slug=slug).first()
        context["version"] = version
        context["reviews"] = version.reviews.all()
        context["relateds"] = ProductVersion.objects.exclude(id=version.id).filter(
            Q(product__id=version.product.id)
            | Q(product__category__name=version.product.category.name)
            | Q(color__name=version.color.name)
        )[:6]

        return context

    def post(self, request, *args, **kwargs):

        form = VersionReviewForm(data=request.POST)
        version = ProductVersion.objects.filter(slug=self.kwargs["slug"]).first()
        if form.is_valid():
            form.instance.user = request.user
            form.instance.version = version
            form.save()
            messages.add_message(request, messages.SUCCESS, _("Your Review was sent succesfully "))
        else:
            messages.add_message(request, messages.WARNING, _("Your review was not sent"))

        return redirect("product_detail", self.kwargs["slug"])
