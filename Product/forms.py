from django import forms
from .models import VersionReview


class VersionReviewForm(forms.ModelForm):

    class Meta:

        model = VersionReview
        fields = (
                    'value',
                    'price',
                    'quality',
                    'summary',
                    'review',
                 )

        widgets = {
           'value': forms.RadioSelect(attrs = {
                'class': 'value'
           }),
           'price': forms.RadioSelect(attrs = {
                'class': 'value'
           }),
           'quality': forms.RadioSelect(attrs = {
                'class': 'value'
           }),
           'summary': forms.TextInput(attrs = {
                'class': 'input-text',
                'id': 'summary_field',
           }),
           'review': forms.Textarea(attrs = {
                'class': 'input-text'
           }),
        }