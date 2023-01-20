from django.db import models


class SubscribeEmail(models.Model):

    email = models.EmailField(max_length=60)
    is_active = models.BooleanField(default=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:

        verbose_name_plural = "Subscribed Emails"

    def __str__(self):
        return f"{self.email}  {self.id}"


class ContactUs(models.Model):

    first_name = models.CharField(max_length=32)
    email = models.EmailField(max_length=64)
    company = models.CharField(max_length=32, null=True, blank=True)
    phone = models.CharField(max_length=16)
    address1 = models.CharField(max_length=64)
    address2 = models.CharField(max_length=64, null=True, blank=True)
    comment = models.TextField()  # rich text field

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:

        verbose_name_plural = "Contact Us"

    def __str__(self):

        return f"{self.first_name}'s requests to contact"


class AboutUs(models.Model):

    address = models.CharField(max_length=64)
    email = models.EmailField(max_length=64)
    phone = models.CharField(max_length=16)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:

        verbose_name_plural = "About Us"

    def __str__(self):

        return "Our Info"


class Social(models.Model):

    name = models.CharField(max_length=32)
    image = models.ImageField(null=True, blank=True, upload_to="images/socials")
    us = models.ForeignKey(AboutUs, on_delete=models.CASCADE, related_name="socials")

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):

        return f"Our {self.name}"
