from django.shortcuts import render, redirect
from django.urls import reverse
from django.views.generic import ListView, DetailView, CreateView
from .models import Blog, BlogCategory, BlogComment
from django.views.generic.edit import FormMixin
from .forms import BlogCommentForm


class BlogView(ListView):

    model = Blog
    template_name = 'blog.html'
    context_object_name = 'blogs'

    def get_context_data(self, **kwargs):
        context = super(BlogView, self).get_context_data(**kwargs)
        context['categories'] = BlogCategory.objects.all()
        return context

class BlogDetailView(DetailView, CreateView):

    model = Blog
    template_name = 'blog_detail.html'
    context_object_name = 'blog'
    form_class = BlogCommentForm

    def get_context_data(self, **kwargs):

        context = super(BlogDetailView, self).get_context_data(**kwargs)
        context['categories'] = BlogCategory.objects.all()
        context['blogs'] = Blog.objects.all()
        context['comments'] = BlogComment.objects.filter(blog__id = self.kwargs['pk'])

        return context

    def post(self, request, *args, **kwargs):
        
        blog = Blog.objects.filter(id = self.kwargs['pk'])
        form = BlogCommentForm(data = request.POST)

        if request.user.is_anonymous:          

            form.instance.blog = blog.first()
            if form.is_valid():
                form.save()
            return redirect('blog_detail', self.kwargs['pk'])
        
        else:

            form.instance.blog = blog.first()
            form.instance.user = request.user
            if form.is_valid():
                form.save()
            return redirect('blog_detail', self.kwargs['pk'])

        


