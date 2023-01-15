from rest_framework.views import APIView
from Blog.models import Blog, BlogCategory, BlogComment
from django.http import JsonResponse
from .serializers import BlogSerializer, CategorySerializer, CategoryPostSerializer


class BlogAPIView(APIView):
    def get(self, *args, **kwargs):
        blogs = Blog.objects.all()
        serializer = BlogSerializer(blogs, context={"request": self.request}, many=True)

        return JsonResponse(serializer.data, safe=False)

    def post(self, request, *args, **kwargs):
        form_data = self.request.data
        serializer = BlogSerializer(data=form_data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data, safe=False)
        return JsonResponse(serializer.errors, safe=False)


class CategoryAPIView(APIView):
    def get(self, *args, **kwargs):

        categories = BlogCategory.objects.all()
        serializer = CategorySerializer(
            categories, context={"request": self.request}, many=True
        )

        return JsonResponse(serializer.data, safe=False)

    def post(self, request, *args, **kwargs):
        form_data = request.data
        serializer = CategoryPostSerializer(data=form_data, context={'request': request})
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data, safe=False, status=201)
        return JsonResponse(serializer.errors, safe=False, status=400)
