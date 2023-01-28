from django.urls import path
from .views import (
        error, about_us, contact_us,
        faq, index, export_view
        # ,SendEmailview
        ) 

urlpatterns = [
    path("", index, name="index"),
    path("404error/", error, name="error"),
    path("about_us/", about_us, name="about_us"),
    path("contact_us/", contact_us, name="contact_us"),
    path("faq/", faq, name="faq"),
    path("export/", export_view, name="export"),
    # path("subscribe/", SendEmailview.as_view(), name="subscribe"),
]
