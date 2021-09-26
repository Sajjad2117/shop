from django.conf import settings
from django.core.validators import MinValueValidator, MaxValueValidator
from django.db import models
from django.utils.translation import gettext_lazy as _

from customer.models import Customer, Address
from product.models import Product


class DiscountCode(models.Model):
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, null=True)
    code = models.CharField(max_length=200, blank=True, null=True)
    amount = models.PositiveSmallIntegerField(default=0, validators=[MinValueValidator(0), MaxValueValidator(100)])
    created = models.DateTimeField(auto_now_add=True)
    expire_date = models.DateTimeField(_("expire date"))
    active = models.BooleanField(_("active"))

    class Meta:
        verbose_name = _("Discount ")
        verbose_name_plural = _("Discounts")

    def __str__(self):
        return f'{self.code} -- {self.amount}%'


class Order(models.Model):
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, null=True)
    product = models.ManyToManyField(Product)
    quantity = models.PositiveIntegerField(default=1)
    address = models.ForeignKey(Address, on_delete=models.CASCADE, null=True)
    discount = models.OneToOneField(DiscountCode, on_delete=models.RESTRICT)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    STATUS = [
        ('0', _("ready to send")),
        ('1', _("sending")),
        ('2', _("delivered")),
    ]
    status = models.CharField(max_length=30, choices=STATUS, default='0')

    class Meta:
        ordering = ('-created',)
        verbose_name = _("Order")
        verbose_name_plural = _("Orders")

    def __str__(self):
        return f'{self.customer.username}'

    @property
    def total_price(self):
        total_price = 0
        for item in self.items.all():
            total_price += item.product.price * item.quantity
        return total_price

    @property
    def total_price_with_discount(self):
        if DiscountCode.objects.filter(product=self).count() > 0:
            total_price_with_discount = int(self.total_price - (self.total_price * DiscountCode.amount / 100))
            return total_price_with_discount


class OrderHistory(models.Model):
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE)
    order = models.ManyToManyField(Order)
    start_date = models.DateTimeField(_("start date"))
    ordered_date = models.DateTimeField(_("Ordered date"))
    status = models.CharField(max_length=100, blank=True, null=True)
    final_price = models.PositiveIntegerField(_("final price"))

    class Meta:
        verbose_name = _("Order history")
        verbose_name_plural = _("Order histories")

    def __str__(self):
        return self.customer.username
