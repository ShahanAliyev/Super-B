from rest_framework import serializers
from Product.models import (
    ProductVersion, ProductVersionDetail, Brand,
    Category, Color, Size, Product
)


class ProductCategoryGetSerializer(serializers.ModelSerializer):

    parent = serializers.PrimaryKeyRelatedField(queryset = Category.objects.all())

    class Meta:

        model = Category
        fields = (
            'name', 'image', 'parent', 
        )
    
    def to_representation(self, value):
        data = super().to_representation(value)  
        parent = ProductCategoryGetSerializer(value.parent, context=self.context)
        data['parent'] = parent.data
        return data


class BrandGetSerializer(serializers.ModelSerializer):

    class Meta:

        model = Brand
        fields = (
            'name', 'image', 'admin',
        )


class SizeGetSerializer(serializers.ModelSerializer):

    class Meta:
        model = Size
        fields = (
            'name',
        )


class ColorGetSerializer(serializers.ModelSerializer):

    class Meta:
        model = Color
        fields = (
            'name',
        )


class ProductGetSerializer(serializers.ModelSerializer):

    brand = BrandGetSerializer()
    category = ProductCategoryGetSerializer()

    class Meta:
        model = Product
        fields = (
            'name', 'price', 'brand', 'category',
        )


class ProductVersionGetSerializer(serializers.ModelSerializer):

    product = ProductGetSerializer()
    color = ColorGetSerializer()
    details = serializers.SerializerMethodField()

    class Meta:

        model = ProductVersion
        fields = (
            'product', 'sell_price', 'color',
            'description', 'raiting', 'details',
        )
    
    def get_details(self, obj):
        serializer = ProductVersionDetailGetSerializer(
            obj.details.all(), context=self.context, many=True
        )
        return serializer.data


class ProductVersionDetailGetSerializer(serializers.ModelSerializer):

    size = SizeGetSerializer()

    class Meta:
        model = ProductVersionDetail
        fields = (
            'size', 'count',
        )
