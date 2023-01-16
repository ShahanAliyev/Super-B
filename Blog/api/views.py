from rest_framework.generics import (
                                    RetrieveUpdateDestroyAPIView,
                                    ListCreateAPIView,
                                    )
from Blog.models import Blog, BlogCategory
from .serializers import    (
                            BlogSerializer, 
                            BlogPostSerializer, 
                            CategorySerializer, 
                            CategoryPostSerializer,
                            )

import django_filters.rest_framework
from rest_framework import filters
from rest_framework.permissions import (IsAuthenticatedOrReadOnly,
                                        IsAuthenticated)


class GenericApiSerializerMixin:

    def get_serializer_class(self):
        return self.serializer_classes[self.request.method]


class BlogAPIView(GenericApiSerializerMixin, ListCreateAPIView):

    queryset = Blog.objects.all()
    permission_classes = (IsAuthenticated,)
    filter_backends = [django_filters.rest_framework.DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['header', 'category',]
    search_fields = ['user__username', 'header']
    serializer_classes = {
        "POST": BlogPostSerializer,
        "GET": BlogSerializer,
    }

class BlogRetriveUpdateDeleteView(GenericApiSerializerMixin, RetrieveUpdateDestroyAPIView):

    queryset = Blog.objects.all()
    serializer_classes = {
        "PATCH": BlogPostSerializer,
        "PUT": BlogPostSerializer,
        "GET": BlogSerializer,
    }


class CategoryAPIView(GenericApiSerializerMixin, ListCreateAPIView):

    queryset = BlogCategory.objects.all()
    serializer_classes = {
        "POST": CategoryPostSerializer,
        "GET": CategorySerializer,
    }



class CategoryRetriveUpdateDeleteView(GenericApiSerializerMixin, RetrieveUpdateDestroyAPIView):

    queryset = BlogCategory.objects.all()
    serializer_classes = {
        "PATCH": CategoryPostSerializer,
        "PUT": CategoryPostSerializer,
        "GET": CategorySerializer,
    }