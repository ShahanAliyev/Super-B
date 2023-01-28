from django.shortcuts import render, redirect
from .forms import ContactUsForm
from django.urls import reverse_lazy
from django.contrib import messages
from django.http import HttpResponse
from .tasks import export
from django.views.generic import ListView
from Blog.models import Blog


def error(request):
    return render(request, "404error.html")


# class SendEmailview(ListView):

#     template_name = 'email-subscribers.html'
#     queryset = Blog.objects.all()
#     context_object_name = 'blogs'

# def send_email(request):
#     return render(request, "email-subscribers.html")

def about_us(request):
    return render(request, "about_us.html")


def contact_us(request):

    form = ContactUsForm()

    if request.method == "POST":
        form = ContactUsForm(data=request.POST)
        print(request.POST)
        if form.is_valid():
            form.save()
            messages.add_message(
                request,
                messages.SUCCESS,
                "Your Contact Informations have been saved successfully ",
            )
            return redirect(reverse_lazy("contact_us"))

    context = {"form": form}
    return render(request, "contact_us.html", context)


def faq(request):
    return render(request, "faq.html")


def index(request):
    return render(request, "index.html")

def export_view(request):
    export.delay()
    return HttpResponse('<h1 style="color:red;">Export edildi</h1>')
