from django.shortcuts import render, redirect
from .forms import ContactUsForm
from django.urls import reverse_lazy
from django.contrib import messages


def error(request):
    return render(request, "404error.html")
    
def about_us(request):
    return render(request, "about_us.html")

def contact_us(request):

    form = ContactUsForm()
    
    if request.method == "POST":
        form = ContactUsForm(data = request.POST)
        print(request.POST)
        if form.is_valid():
            form.save()
            messages.add_message(request, messages.SUCCESS, 'Your Contact Informations have been saved successfully ')
            return redirect(reverse_lazy('contact_us'))

    context = {
        'form': form
    }
    return render(request, "contact_us.html", context )

def faq(request):
    return render(request, "faq.html")

def index(request):
    return render(request, "index.html")