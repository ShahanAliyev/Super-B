from django.test import SimpleTestCase
from django.urls import reverse, resolve
from .views import BlogView, BlogDetailView
from .models import Blog, BlogCategory


class TestUrls(SimpleTestCase):

    def test_blog_url(self):
        url = reverse('blog')
        self.assertEqual(resolve(url).func.view_class, BlogView) #resolve(url).func for functional views

    def test_blog_detail_url(self):
        url = reverse('blog_detail', args = ['some-slug'])
        self.assertEqual(resolve(url).func.view_class, BlogDetailView)