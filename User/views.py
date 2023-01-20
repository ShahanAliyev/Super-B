from .forms import ContactInformationForm, RegistrationForm, LoginForm
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic import CreateView, View
from django.contrib.auth.views import LoginView
from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from django.contrib import messages

from django.contrib.sites.shortcuts import get_current_site
from django.contrib.auth import get_user_model, login
from django.utils.http import urlsafe_base64_decode
from .tokens import account_activation_token
from django.utils.encoding import force_str
from .tasks import send_confirmation_mail


User = get_user_model()


def account_information(request):
    return render(request, "account_information.html")


def address_book(request):
    return render(request, "address_book.html")


def contact_information(request):

    form = ContactInformationForm()

    if request.method == "POST":

        form = ContactInformationForm(data=request.POST)
        if form.is_valid():
            form.save()
            messages.add_message(
                request,
                messages.SUCCESS,
                "Your Contact Informations have been saved successfully ",
            )
            return redirect(reverse_lazy("contact_information"))

    context = {"form": form}
    return render(request, "contact_information.html", context)


def forgot_password(request):
    return render(request, "forgot_password.html")


class CustomLoginView(LoginView):

    template_name = "login.html"
    form_class = LoginForm
    success_url = "index"


class RegisterView(CreateView):

    form_class = RegistrationForm
    template_name = "register.html"
    success_url = reverse_lazy("login")

    def form_valid(self, form):
        result = super().form_valid(form)
        send_confirmation_mail(
            user=self.object, current_site=get_current_site(self.request)
        )
        return result


class ActivateAccoontView(View):
    def get(self, *args, **kwargs):

        uidb64 = kwargs["uidb64"]
        token = kwargs["token"]

        try:
            uid = force_str(urlsafe_base64_decode(uidb64))
            user = User.objects.get(pk=uid)
        except (TypeError, ValueError, OverflowError, User.DoesNotExist):
            user = None

        if user is not None and account_activation_token.check_token(user, token):
            user.is_active = True
            user.save()
            messages.success(self.request, "Your account created succesfully")
            return redirect(reverse_lazy("login"))
        else:
            messages.warning(self.request, "Something went wrong")
            return redirect(reverse_lazy("register"))
