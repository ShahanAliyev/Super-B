from django.db import models
from django.contrib.auth import get_user_model
User = get_user_model()


class ContactInformation(models.Model):

    COUNTRY_FIRST = 'Az'
    COUNTRY_CHOICES = [
        (COUNTRY_FIRST ,'Azerbaijan'),
        ('2','Turkey'),
        ('3','Germany'),
        ('4','USA'),
    ]

    first_name = models.CharField(max_length = 32)
    last_name = models.CharField(max_length = 32)
    phone = models.CharField(max_length = 16)
    address1 = models.CharField(max_length = 64)
    address2 = models.CharField(max_length = 64, null = True, blank = True)
    country = models.CharField(max_length = 16, choices = COUNTRY_CHOICES, default = COUNTRY_FIRST) # api is must
    city = models.CharField(max_length = 64) # api is must
    user = models.ForeignKey(User, on_delete = models.CASCADE, related_name = 'contact_info', null = True, blank = True)
    postal_code = models.CharField(max_length = 8, null = True, blank = True)
    default_billing_address = models.BooleanField(default = False)
    default_shipping_address = models.BooleanField(default = False)

    def __str__(self):

        return f"{self.first_name}' contact information "