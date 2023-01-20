from django.urls import path
from .views import (
    BlogAPIView,
    CategoryAPIView,
    CategoryRetriveUpdateDeleteView,
    BlogRetriveUpdateDeleteView,
)

urlpatterns = [
    path("blogs/", BlogAPIView.as_view(), name="api_blogs"),
    path("blogs/<int:pk>", BlogRetriveUpdateDeleteView.as_view(), name="api_blog"),
    path("categories/", CategoryAPIView.as_view(), name="api_blog_categories"),
    path(
        "categories/<int:pk>",
        CategoryRetriveUpdateDeleteView.as_view(),
        name="api_blog_category",
    ),
]
