from django.conf import settings
from django.core.mail import EmailMultiAlternatives
from django.contrib.sites.shortcuts import get_current_site
from django.utils.encoding import force_bytes
from django.utils.http import urlsafe_base64_encode
from django.template.loader import render_to_string
from .tokens import account_activation_token


def send_confirmation_mail(user, current_site):

    message = message = render_to_string('activation.html', {
                'user': user,
                'domain': current_site.domain,
                'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                'token': account_activation_token.make_token(user),
            })
    subject = 'Confirm Your SuperB acoount'
    recipient = [user.email, ]
    host = settings.EMAIL_HOST_USER
    mail = EmailMultiAlternatives(subject = subject, body = message, from_email = host, to = recipient)
    mail.content_subtype = 'html'
    mail.send()