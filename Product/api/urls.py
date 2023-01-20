from django.urls import path
from .views import CategoryApiView, VersionApiView, BrandApiView

urlpatterns = [
    path("product_categories/", CategoryApiView.as_view(), name="categories_api"),
    path("brands/", BrandApiView.as_view(), name="brands"),
    path("versions/", VersionApiView.as_view(), name="versions"),
]
