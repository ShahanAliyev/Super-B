from django.contrib import admin

from .models import SubscribeEmail, ContactUs, AboutUs, Social


admin.site.register(Social)
admin.site.register(AboutUs)
# admin.site.register(SubscribeEmail)
# admin.site.register(ContactUs)


@admin.register(SubscribeEmail)
class SubscriberAdmin(admin.ModelAdmin):

    search_fields = ("email",)


@admin.register(ContactUs)
class ContactUsAdmin(admin.ModelAdmin):

    search_fields = (
        "first_name",
        "email",
    )
