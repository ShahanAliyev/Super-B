from django import forms
from .models import ContactInformation
from django.contrib.messages import constants as messages
from django.contrib.auth import get_user_model
from django.core.exceptions import ValidationError

User = get_user_model()

class ContactInformationForm(forms.ModelForm):
    
    class Meta:

        model = ContactInformation
        fields = (
            'first_name',
            'last_name',
            'phone',
            'address1',
            'address2',
            'country',
            'city',
            'postal_code',
            'default_billing_address',
            'default_shipping_address',
        )
        widgets = {
           'first_name': forms.TextInput(attrs = {
                'class': 'input-text',
                'autofocus': True,
           }),
           'last_name': forms.TextInput(attrs = {
                'class': 'input-text',
                'autofocus': True,
           }),
           'phone': forms.TextInput(attrs = {
                'class': 'input-text'
           }),
           'address1': forms.TextInput(attrs = {
                'class': 'input-text'
           }),
           'address2': forms.TextInput(attrs = {
                'class': 'input-text'
           }),
           'country': forms.Select(attrs = {
                'class': 'input-text'
           }),
           'city': forms.TextInput(attrs = {
                'class': 'input-text'
           }),
           'postal_code': forms.TextInput(attrs = {
                'class': 'input-text'
           }),
           'default_billing_address': forms.CheckboxInput(attrs = {
                'class': 'checkbox'
           }),
           'default_shipping_address': forms.CheckboxInput(attrs = {
                'class': 'checkbox'
           }),
        }


class RegisterationForm(forms.ModelForm):

     confirm_password = forms.CharField(widget = forms.PasswordInput(attrs = {
          'class': 'input-text',
          'placeholder': 'Confirm Password'
     }))

     class Meta:

          model = User
          fields  = (
                    'first_name',
                    'last_name',
                    'username',
                    'email',
                    'password',
                    'confirm_password')

          widgets = {
           'first_name': forms.TextInput(attrs = {
                'class': 'input-text',
                'autofocus': True,
                'placeholder': 'First Name'
           }),
           'last_name': forms.TextInput(attrs = {
                'class': 'input-text',
                'placeholder': 'Last Name'
           }),

           'username': forms.TextInput(attrs = {
                'class': 'input-text',
                'placeholder': 'Username'
           }),
           'email': forms.EmailInput(attrs = {
                'class': 'input-text',
                'placeholder': 'Email Address'
           }),
           'password': forms.PasswordInput(attrs = {
                'class': 'input-text',
                'placeholder': 'Password'
           }),
           
        }

     def clean_confirm_password(self):
          if self.cleaned_data['confirm_password'] != self.cleaned_data['password']:
               raise ValidationError('Confirm password did not match with Password')


class LoginForm(forms.Form):
      

     email = forms.EmailField(widget = forms.EmailInput(attrs = {
          'class': 'input-text',
          'placeholder': 'Email'
     }))
     password = forms.CharField(widget = forms.PasswordInput(attrs = {
          'class': 'input-text',
          'placeholder': 'Password'
     }))