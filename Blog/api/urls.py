from django.urls import path
from .views import BlogAPIView, CategoryAPIView

urlpatterns = [
    path("blogs/", BlogAPIView.as_view(), name="blog"),
    path("categories/", CategoryAPIView.as_view(), name="blog"),
]
