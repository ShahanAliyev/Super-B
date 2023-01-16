from django.urls import path
from .views import (
                    BlogAPIView,
                    CategoryAPIView, 
                    CategoryRetriveUpdateDeleteView,
                    BlogRetriveUpdateDeleteView
                    )

urlpatterns = [
    path("blogs/", BlogAPIView.as_view(), name="blog"),
    path("blogs/<int:pk>", BlogRetriveUpdateDeleteView.as_view(), name="blog"),
    path("categories/", CategoryAPIView.as_view(), name="blog"),
    path("categories/<int:pk>", CategoryRetriveUpdateDeleteView.as_view(), name="blog"),
]
