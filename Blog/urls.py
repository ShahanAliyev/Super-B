from django.urls import path, include
from .views import BlogView, BlogDetailView

urlpatterns = [
    path("blog/", BlogView.as_view(), name="blog"),
    path("blog_detail/<slug:slug>", BlogDetailView.as_view(), name="blog_detail"),
    path("api/", include("Blog.api.urls")),
]
