from django import forms
from .models import ContactUs


class ContactUsForm(forms.ModelForm):
    class Meta:
        model = ContactUs
        fields = (
            "first_name",
            "email",
            "company",
            "phone",
            "address1",
            "address2",
            "comment",
        )
        widgets = {
            "first_name": forms.TextInput(
                attrs={
                    "class": "input-text",
                    "autofocus": True,
                }
            ),
            "email": forms.EmailInput(attrs={"class": "input-text"}),
            "company": forms.TextInput(attrs={"class": "input-text"}),
            "phone": forms.TextInput(attrs={"class": "input-text"}),
            "address1": forms.TextInput(attrs={"class": "input-text"}),
            "address2": forms.TextInput(attrs={"class": "input-text"}),
            "comment": forms.Textarea(attrs={"class": "input-text"}),
        }
