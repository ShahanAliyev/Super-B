from django.shortcuts import render, redirect
from django.urls import reverse
from django.views.generic import ListView, DetailView, CreateView
from .models import Blog, BlogCategory, BlogComment
from .forms import BlogCommentForm, AuthBlogCommentForm
from django.contrib import messages



class BlogView(ListView):

    model = Blog
    template_name = 'blog.html'
    context_object_name = 'blogs'

    def get_context_data(self, **kwargs):
        context = super(BlogView, self).get_context_data(**kwargs)
        context['categories'] = BlogCategory.objects.all()
        context['popular'] = Blog.objects.order_by('-read_count')[:4]
        return context
    
    def get_queryset(self):

        category = self.request.GET.get('category')
        blog = self.request.GET.get('blog')
        if category:
            queryset = Blog.objects.filter(category__name = category)
        elif blog:
            queryset = Blog.objects.filter(id = blog)
        else:
            queryset = Blog.objects.all()
        return queryset


class BlogDetailView(DetailView, CreateView):

    model = Blog
    template_name = 'blog_detail.html'
    context_object_name = 'blog'
    form_class = BlogCommentForm

    def get(self, request, *args, **kwargs):

        blog = Blog.objects.filter(id = self.kwargs['pk']).first()
        blog.read_count += 1
        blog.save()

        return super().get(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        
        blog = Blog.objects.filter(id = self.kwargs['pk'])

        if request.user.is_anonymous:       
               
            form.instance.blog = blog.first()
            print(form)
            if form.is_valid():
                form.save()
            else:
                messages.add_message(request, messages.WARNING, 'Unsuccessfull')
            return redirect('blog_detail', self.kwargs['pk'])
        
        else:

            form = AuthBlogCommentForm(data = request.POST)
            form.instance.blog = blog.first()
            form.instance.user = request.user
            form.instance.name = request.user.username
            form.instance.email = request.user.email

            if form.is_valid():
                form.save()
            else:
                messages.add_message(request, messages.WARNING, 'Unsuccessfull')
            return redirect('blog_detail', self.kwargs['pk'])
    
    def get_context_data(self, **kwargs):

        context = super(BlogDetailView, self).get_context_data(**kwargs)
        context['comments'] = BlogComment.objects.filter(blog__id = self.kwargs['pk'])

        return context




