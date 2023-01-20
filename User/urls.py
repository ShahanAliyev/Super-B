from django.urls import path, include
from .views import (
    account_information,
    address_book,
    contact_information,
    forgot_password,
)

from .views import CustomLoginView, ActivateAccoontView, RegisterView
from django.contrib.auth.views import LogoutView
from django.contrib.auth import views as auth_views

urlpatterns = [
    path("account_information/", account_information, name="account_information"),
    path("address_book/", address_book, name="address_book"),
    path("contact_information/", contact_information, name="contact_information"),
    path("login/", CustomLoginView.as_view(), name="login"),
    path("logout/", LogoutView.as_view(), name="logout"),
    path("register/", RegisterView.as_view(), name="register"),
    path(
        "activate/<str:uidb64>/<str:token>/",
        ActivateAccoontView.as_view(),
        name="activate",
    ),
    path(
        "reset_password/",
        auth_views.PasswordResetView.as_view(
            template_name="password/password_reset.html"
        ),
        name="reset_password",
    ),
    path(
        "reset_password_sent/",
        auth_views.PasswordResetDoneView.as_view(
            template_name="password/password_reset_done.html"
        ),
        name="password_reset_done",
    ),
    path(
        "reset/<uidb64>/<token>/",
        auth_views.PasswordResetConfirmView.as_view(
            template_name="password/password_reset_confirm.html"
        ),
        name="password_reset_confirm",
    ),
    path(
        "reset_password_complete/",
        auth_views.PasswordResetCompleteView.as_view(
            template_name="password/password_reset_complete.html"
        ),
        name="password_reset_complete",
    ),
    path("api/", include("User.api.urls")),
]
