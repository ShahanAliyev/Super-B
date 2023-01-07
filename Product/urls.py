from django.urls import path
from .views import product_detail,  quick_view, ProductListView

urlpatterns = [
    path('product_list/', ProductListView.as_view() , name = "product_list"),
    path('product_detail/', product_detail, name = "product_detail"),
    path('quick_view/', quick_view, name = "quick_view"),
]