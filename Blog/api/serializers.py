from rest_framework import serializers
from Blog.models import Blog, BlogCategory, BlogComment


class CategorySerializer(serializers.ModelSerializer):

    blogs = serializers.SerializerMethodField()

    class Meta:
        model = BlogCategory
        fields = (
            "id",
            "name",
            "image",
            "blogs",
        )

    def get_blogs(self, obj):
        serializer = BlogCategorySerializer(
            obj.blogs.all(), context=self.context, many=True
        )
        return serializer.data


class BlogSerializer(serializers.ModelSerializer):

    category = CategorySerializer()

    class Meta:
        model = Blog
        fields = (
            "id",
            "header",
            "description",
            "image",
            "category",
            "read_count",
        )


class BlogCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Blog
        fields = (
            "id",
            "header",
            "description",
            "image",
            "category",
            "read_count",
        )


class CategoryPostSerializer(serializers.ModelSerializer):
    class Meta:
        model = BlogCategory
        fields = ("name", "image")
