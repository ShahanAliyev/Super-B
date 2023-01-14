from django.urls import path
from .views import quick_view, ProductListView, ProductDetailView

urlpatterns = [
    path("product_list/", ProductListView.as_view(), name="product_list"),
    path(
        "product_detail/<slug:slug>",
        ProductDetailView.as_view(),
        name="product_detail",
    ),
    path("quick_view/", quick_view, name="quick_view"),
]
