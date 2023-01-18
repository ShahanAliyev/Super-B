from rest_framework import serializers
from Order.models import Wishlist, Basket, BasketItem
from django.contrib.auth import get_user_model
from Product.api.serializers import ProductVersionGetSerializer


class WishListSerializer(serializers.ModelSerializer):

    version = ProductVersionGetSerializer()
    class Meta:
        model = Wishlist
        fields = (
           'id', 'user', 'version',
        )


class WishListPostSerializer(serializers.ModelSerializer):

    class Meta:
        model = Wishlist
        fields = (
           'user', 'version',
        )
    
    def create(self, validated_data):
        instance, created = Wishlist.objects.get_or_create(**validated_data)

        if created:
            print('created')
            
        elif instance:
            instance.delete()
            print('deleted')

        return self.data

    def validate(self, data):
        request = self.context['request']
        data ['user'] = request.user
        return super().validate(data)


class BasketSerializer(serializers.ModelSerializer):

    items = serializers.SerializerMethodField()

    class Meta:
        model = Basket
        fields = (
            'user', 'is_active', 'total_price', 'items',
        )

    def get_items(self, obj):
        serializer = ItemForBasketSerializer(
        obj.items.all(), context=self.context, many=True
        )
        return serializer.data


class BasketForItemSerializer(serializers.ModelSerializer):

    class Meta:
        model = Basket
        fields = (
            'user', 'is_active', 'total_price',
        )


class BasketItemSerializer(serializers.ModelSerializer):

    basket = BasketForItemSerializer()
    version = ProductVersionGetSerializer()

    class Meta:
        model = BasketItem
        fields = (
            'id','basket', 'version', 'count',
        )

        
class BasketItemPostSerializer(serializers.ModelSerializer):

    class Meta:
        model = BasketItem
        fields = (
            'id','basket', 'version', 'count',
        )


class ItemForBasketSerializer(serializers.ModelSerializer):

    version = ProductVersionGetSerializer()

    class Meta:
        model = BasketItem
        fields = (
            'id', 'version', 'count',
        )