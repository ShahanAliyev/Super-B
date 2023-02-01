from django.test import TestCase
from .models import BlogComment, Blog
from django.contrib.auth import get_user_model

User = get_user_model()


class TestModels(TestCase):

    @classmethod
    def setUpClass(cls):
        cls.user1 = User.objects.first()
        cls.blog1 = Blog.objects.first()
        cls.data1 = {
            'name': 'Shahan',
            'email': 'aliyevsahan@gmail.com',
            'comment': 'random comment for test model',
            'blog': cls.blog1,
            'user': cls.user1,
        }

        cls.comment1 = BlogComment.objects.create(**cls.data1)

    def test_name(self):
        self.assertEqual(self.data1['name'], self.comment1.name)

    def test_user(self):
        self.assertEqual(self.data1['user'], self.comment1.user)

    def test_blog(self):
        self.assertEqual(self.data1['blog'], self.comment1.blog)

    def test_str(self):
        expected = f"{self.comment1.name}'s comment to {self.comment1.id}"
        self.assertEqual(str(self.comment1), expected)
    
    @classmethod
    def tearDownClass(cls):
        del cls.user1
        del cls.data1
        del cls.comment1
