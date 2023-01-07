from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from .forms import ContactInformationForm, RegistrationForm, LoginForm
from django.contrib import messages
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.views import LoginView
from django.views.generic import CreateView


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


class CustomLoginView(LoginView):

    template_name = 'login.html'
    form_class = LoginForm
    success_url = 'index'

class RegisterView(CreateView):

    form_class = RegistrationForm
    template_name = 'register.html'
    success_url = reverse_lazy('login')
    
