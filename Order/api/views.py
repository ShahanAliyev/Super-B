from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView
from Order.models import Basket, BasketItem, Wishlist
from .serializers import (
    WishListSerializer,
    BasketItemSerializer,
    BasketSerializer,
    WishListPostSerializer,
    BasketItemPostSerializer,
)


class GenericApiSerializerMixin:

    def get_serializer_class(self):
        return self.serializer_classes[self.request.method]


class WishlistApiView(GenericApiSerializerMixin, ListCreateAPIView):

    queryset = Wishlist.objects.all()
    serializer_classes = {"GET": WishListSerializer, "POST": WishListPostSerializer}


class BasketsApiView(ListCreateAPIView):

    queryset = Basket.objects.all()
    serializer_class = BasketSerializer


class BasketApiView(RetrieveUpdateDestroyAPIView):

    queryset = Basket.objects.all()
    serializer_class = BasketSerializer


class BasketItemsApiView(GenericApiSerializerMixin, ListCreateAPIView):

    serializer_classes = {
        "GET": BasketItemSerializer,
        "POST": BasketItemPostSerializer,
    }

    def get_queryset(self):
        queryset = BasketItem.objects.filter(basket__user=self.request.user, basket__is_active= True)
        return queryset


class RetriveUpdateDeleteBasketItemApiView(GenericApiSerializerMixin, RetrieveUpdateDestroyAPIView):

    serializer_classes = {
        "GET": BasketItemSerializer,
        "PATCH": BasketItemPostSerializer,
        "PUT": BasketItemPostSerializer,
        "DELETE": BasketItemPostSerializer,
    }

    def get_queryset(self):
        queryset = BasketItem.objects.filter(basket__user=self.request.user)
        return queryset