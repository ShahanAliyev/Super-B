from django.conf import settings
from django.core.mail import EmailMultiAlternatives
from django.contrib.sites.shortcuts import get_current_site
from django.utils.encoding import force_bytes
from django.utils.http import urlsafe_base64_encode
from django.template.loader import render_to_string
from .tokens import account_activation_token

from celery import shared_task
from .models import SubsciriberEmail
from Blog.models import Blog

def send_confirmation_mail(user, current_site):

    message = message = render_to_string(
        "activation.html",
        {
            "user": user,
            "domain": current_site.domain,
            "uid": urlsafe_base64_encode(force_bytes(user.pk)),
            "token": account_activation_token.make_token(user),
        },
    )
    subject = "Confirm Your SuperB acoount"
    recipient = [
        user.email,
    ]
    host = settings.EMAIL_HOST_USER
    mail = EmailMultiAlternatives(
        subject=subject, body=message, from_email=host, to=recipient
    )
    mail.content_subtype = "html"
    mail.send()


@shared_task
def send_mail_to_subscribers():

    email_list = SubsciriberEmail\
        .objects.values_list('email', flat = True)
    blogs = Blog.objects.all()

    message = render_to_string(
        "email-subscribers.html",
        {
            'blogs': blogs
        },
    )
    subject = "Lern about SuperB blogs"
    host = settings.EMAIL_HOST_USER
    mail = EmailMultiAlternatives(
        subject=subject, body=message, from_email=host, to=email_list
    )
    mail.content_subtype = "html"
    mail.send()