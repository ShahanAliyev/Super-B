from django import forms
from .models import BlogComment


class BlogCommentForm(forms.ModelForm):
    
    class Meta:

        model = BlogComment
        fields = ('name',
                'email', 
                'comment',
                )
        widgets = {
           'name': forms.TextInput(attrs = {
                'class': 'input-text',
           }),
           'email': forms.EmailInput(attrs = {
                'class': 'input-text'
           }),
           'comment': forms.Textarea(attrs = {
                'class': 'input-text'
           }),
        }
        
    
