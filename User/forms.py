from django import forms
from .models import ContactInformation
from django.contrib.messages import constants as messages


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