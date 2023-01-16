from rest_framework import serializers
from Blog.models import Blog, BlogCategory


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
            "user",
        )



class BlogPostSerializer(serializers.ModelSerializer):

    user = serializers.PrimaryKeyRelatedField(read_only=True)

    class Meta:
        model = Blog
        fields = ('header','category', 'user')

    def validate(self, data):
        request = self.context['request']
        data['user'] = request.user
        return super().validate(data)


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
