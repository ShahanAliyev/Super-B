from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from .forms import ContactInformationForm
from django.contrib import messages



def account_information(request):
    return render(request, "account_information.html")

def address_book(request):
    return render(request, "address_book.html")

def contact_information(request):

    form = ContactInformationForm()

    if request.method == "POST":
        
        form = ContactInformationForm(data = request.POST)
        if form.is_valid():
            form.save()
            messages.add_message(request, messages.SUCCESS, 'Your Contact Informations have been saved successfully ')
            return redirect(reverse_lazy('contact_information'))

    context = {
        'form': form
    }
    return render(request, "contact_information.html", context)

def forgot_password(request):
    return render(request, "forgot_password.html")

def login(request):
    return render(request, "login.html")

def register(request):
    return render(request, "register.html")
