from rest_framework.generics import (
    ListAPIView,
    ListCreateAPIView,
    RetrieveUpdateDestroyAPIView,
)
from Product.models import ProductVersion, Brand, Category
from .serializers import (
    ProductCategoryGetSerializer,
    ProductVersionGetSerializer,
    BrandGetSerializer,
)
from rest_framework.permissions import (
    IsAuthenticatedOrReadOnly,
    IsAuthenticated)


class CategoryApiView(ListAPIView):

    queryset = Category.objects.all()
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = ProductCategoryGetSerializer


class BrandApiView(ListAPIView):

    queryset = Brand.objects.all()
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = BrandGetSerializer


class VersionApiView(ListAPIView):

    queryset = ProductVersion.objects.all()
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = ProductVersionGetSerializer
