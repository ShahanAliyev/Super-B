from django.urls import path, include
from .views import quick_view, ProductListView, ProductDetailView
from django.views.decorators.cache import never_cache

urlpatterns = [
    path("product_list/", ProductListView.as_view(), name="product_list"), # never_cache(ProductListView.as_view())  can be used for not caching
    path(
        "product_detail/<slug:slug>",
        ProductDetailView.as_view(),
        name="product_detail",
    ),
    path("quick_view/", quick_view, name="quick_view"),
    path("api/", include("Product.api.urls")),
]
