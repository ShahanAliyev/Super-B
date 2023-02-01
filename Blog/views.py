from django.shortcuts import render, redirect
from django.urls import reverse
from django.views.generic import ListView, DetailView, CreateView
from .models import Blog, BlogCategory, BlogComment
from .forms import BlogCommentForm, AuthBlogCommentForm
from django.contrib import messages
from django.utils.translation import gettext_lazy as _


class BlogView(ListView):

    model = Blog
    template_name = "blog.html"
    context_object_name = "blogs"
    # paginate_by = 1

    def get_context_data(self, **kwargs):
        context = super(BlogView, self).get_context_data(**kwargs)
        context["categories"] = BlogCategory.objects.all()
        context["popular"] = Blog.objects.order_by("-read_count")[:4]
        return context

    def get_queryset(self):

        category = self.request.GET.get("category")
        blog = self.request.GET.get("blog")
        if category:
            queryset = Blog.objects.filter(category__name=category)
        elif blog:
            queryset = Blog.objects.filter(id=blog)
        else:
            queryset = Blog.objects.all()
        return queryset


class BlogDetailView(DetailView, CreateView):

    model = Blog
    template_name = "blog_detail.html"
    context_object_name = "blog"
    form_class = BlogCommentForm

    def get(self, request, *args, **kwargs):

        blog = Blog.objects.filter(slug=self.kwargs["slug"]).first()
        blog.read_count += 1
        blog.save()

        return super().get(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):

        blog = Blog.objects.filter(id=self.kwargs["slug"])

        if request.user.is_anonymous:

            form = BlogCommentForm(data=request.POST)
            form.instance.blog = blog.first()
            if form.is_valid():
                form.save()
                messages.add_message(
                    request, messages.SUCCESS, _("Your Comment was sent succesfully ")
                )
            else:
                messages.add_message(
                    request,
                    messages.WARNING,
                    _("Something happened, please try again "),
                )
            return redirect("blog_detail", self.kwargs["slug"])

        else:

            form = AuthBlogCommentForm(data=request.POST)
            form.instance.blog = blog.first()
            form.instance.user = request.user
            form.instance.name = request.user.username
            form.instance.email = request.user.email

            if form.is_valid():
                form.save()
                messages.add_message(
                    request, messages.SUCCESS, _("Your Comment was sent succesfully ")
                )
            else:
                messages.add_message(
                    request,
                    messages.WARNING,
                    _("Something happened, please try again "),
                )
            return redirect("blog_detail", self.kwargs["pk"])

    def get_context_data(self, **kwargs):

        context = super(BlogDetailView, self).get_context_data(**kwargs)
        context["comments"] = BlogComment.objects.filter(blog__slug=self.kwargs["slug"])

        return context
