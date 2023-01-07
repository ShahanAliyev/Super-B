from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from .forms import ContactInformationForm, RegisterationForm, LoginForm
from django.contrib import messages
from django.contrib.auth import authenticate
from django.contrib.auth import login, logout
from django.contrib.auth.decorators import login_required



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

def login_view(request):

    form = LoginForm()
    if request.method == "POST":
            form = LoginForm(request.POST)
            if form.is_valid():
                email = form.cleaned_data['email']
                password = form.cleaned_data['password']
                user = authenticate(request, email = email, password = password)
                if user is not None:
                    login(request, user)
                    return redirect('/')
                else:
                    messages.add_message(request, messages.ERROR, 'Error')
                return redirect(reverse_lazy('login'))
    context = {
        'form': form
    }
    return render(request, "login.html", context)

@login_required
def logout_view(request):
    logout(request)
    return redirect(reverse_lazy('index'))


def register(request):
    form = RegisterationForm()
    if request.method == "POST":
        form = RegisterationForm(request.POST)
        if form.is_valid():
            user = form.save()
            user.set_password(form.cleaned_data['password'])
            user.save()
            messages.add_message(request, messages.SUCCESS, 'Your Contact Informations have been saved successfully ')
            return redirect(reverse_lazy('login'))

    context = {
        'form' : form
    }
    return render(request, "register.html", context)
