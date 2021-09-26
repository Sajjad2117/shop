from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils.translation import gettext_lazy as _


class Customer(AbstractUser):
    email = models.EmailField(_('Email Address'), unique=True)
    mobile = models.CharField(
        verbose_name=_('Mobile Number'),
        max_length=10,
        unique=True,
        blank=True, null=True,
    )
    profile_image = models.ImageField(
        verbose_name=_("Profile Photo"),
        upload_to="customer/user_images",
        null=True, blank=True
    )
    amount_of_shopping = models.PositiveIntegerField(_('amount of shopping'), default=0)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=True)

    class Meta:
        verbose_name = _("Customer")
        verbose_name_plural = _("Customers")


class Address(models.Model):
    customer = models.ForeignKey(Customer, on_delete=models.SET_NULL, null=True)
    country = models.CharField(_("Country"), max_length=50, null=True, blank=True)
    province = models.CharField(_("province"), max_length=50, null=True, blank=True)
    city = models.CharField(_("City"), max_length=50)
    phone = models.CharField(_("Phone Number"), max_length=50)
    postcode = models.CharField(_("Postcode"), max_length=50)
    address_line = models.CharField(_("Address Line"), max_length=200)
    created_at = models.DateTimeField(_("Created at"), auto_now_add=True)
    updated_at = models.DateTimeField(_("Updated at"), auto_now=True)

    class Meta:
        verbose_name = "Address"
        verbose_name_plural = "Addresses"

    def __str__(self):
        return "Address"
