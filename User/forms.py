from django import forms
from .models import ContactInformation
from django.contrib.messages import constants as messages
from django.contrib.auth import get_user_model, password_validation
from django.contrib.auth.forms import AuthenticationForm, UserCreationForm
from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _


User = get_user_model()


class ContactInformationForm(forms.ModelForm):
    class Meta:

        model = ContactInformation
        fields = (
            "first_name",
            "last_name",
            "phone",
            "address1",
            "address2",
            "country",
            "city",
            "postal_code",
            "default_billing_address",
            "default_shipping_address",
        )
        widgets = {
            "first_name": forms.TextInput(
                attrs={
                    "class": "input-text",
                    "autofocus": True,
                }
            ),
            "last_name": forms.TextInput(
                attrs={
                    "class": "input-text",
                    "autofocus": True,
                }
            ),
            "phone": forms.TextInput(attrs={"class": "input-text"}),
            "address1": forms.TextInput(attrs={"class": "input-text"}),
            "address2": forms.TextInput(attrs={"class": "input-text"}),
            "country": forms.Select(attrs={"class": "input-text"}),
            "city": forms.TextInput(attrs={"class": "input-text"}),
            "postal_code": forms.TextInput(attrs={"class": "input-text"}),
            "default_billing_address": forms.CheckboxInput(
                attrs={"class": "checkbox"}
            ),
            "default_shipping_address": forms.CheckboxInput(
                attrs={"class": "checkbox"}
            ),
        }


class RegistrationForm(UserCreationForm):

    password1 = forms.CharField(
        label=_("Password"),
        strip=False,
        widget=forms.PasswordInput(
            attrs={
                "autocomplete": "new-password",
                "class": "input-text",
                "placeholder": "Password",
            }
        ),
        help_text=password_validation.password_validators_help_text_html(),
    )
    password2 = forms.CharField(
        label=_("Password"),
        strip=False,
        widget=forms.PasswordInput(
            attrs={
                "autocomplete": "new-password",
                "class": "input-text",
                "placeholder": "Confirm Password",
            }
        ),
        help_text=password_validation.password_validators_help_text_html(),
    )

    class Meta:

        model = User
        fields = (
            "first_name",
            "last_name",
            "username",
            "email",
        )

        widgets = {
            "first_name": forms.TextInput(
                attrs={
                    "class": "input-text",
                    "autofocus": True,
                    "placeholder": "First Name",
                }
            ),
            "last_name": forms.TextInput(
                attrs={"class": "input-text", "placeholder": "Last Name"}
            ),
            "username": forms.TextInput(
                attrs={"class": "input-text", "placeholder": "Username"}
            ),
            "email": forms.EmailInput(
                attrs={"class": "input-text", "placeholder": "Email"}
            ),
        }

    def save(self, commit=True):
        user = super().save(commit=False)
        user.is_active = False
        if commit:
            user.save()
        return user


class LoginForm(AuthenticationForm):

    username = forms.CharField(
        widget=forms.TextInput(
            attrs={"class": "input-text", "placeholder": "Username"}
        )
    )
    password = forms.CharField(
        widget=forms.PasswordInput(
            attrs={"class": "input-text", "placeholder": "Password"}
        )
    )
