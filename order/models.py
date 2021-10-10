from datetime import date

from django.conf import settings
from django.core.validators import MinValueValidator, MaxValueValidator
from django.db import models
from django.utils.translation import gettext_lazy as _

from customer.models import Customer, Address
from product.models import Product


class DiscountCode(models.Model):
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, null=True)
    code = models.CharField(max_length=200, blank=True, null=True, )
    amount = models.PositiveSmallIntegerField(default=0, validators=[MinValueValidator(0), MaxValueValidator(100)])
    created = models.DateTimeField(auto_now_add=True)
    expire_date = models.DateTimeField(_("expire date"))
    is_active = models.BooleanField(default=True)  ######## property

    # @property
    # def verify(self):
    #     coupon = DiscountCode.objects.filter(code=code)
    #     if coupon.exists() and coupon[0].expire_date > date.today():
    #         return Response({'valid': True})
    #     else:
    #         return Response({'valid': False})

    class Meta:
        verbose_name = _("Discount ")
        verbose_name_plural = _("Discounts")

    def __str__(self):
        return f'{self.code} -- {self.amount}%'


class OrderItem(models.Model):
    product = models.CharField(max_length=200)
    quantity = models.IntegerField(_("quantity"), default=1)

    class Meta:
        verbose_name = _("Order item")
        verbose_name_plural = _("Order items")

    def __str__(self):
        return f'{self.product}'


class Order(models.Model):
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, null=True)
    address = models.ForeignKey(Address, on_delete=models.SET_NULL, null=True)
    products = models.ManyToManyField(OrderItem)   # ForeignKey
    discount = models.OneToOneField(DiscountCode, on_delete=models.RESTRICT, null=True, blank=True)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    READY_TO_SEND = 'ready to send'
    SENDING = 'sending'
    DELIVERED = 'delivered'
    STATUS = [
        (READY_TO_SEND, _('ready to send')),
        (SENDING, _('sending')),
        (DELIVERED, _('delivered')),
    ]

    status = models.CharField(max_length=30, choices=STATUS, default='ready to send')
    total_price = models.PositiveIntegerField(_("total_price "), null=True)

    class Meta:
        ordering = ('-created',)
        verbose_name = _("Order")
        verbose_name_plural = _("Orders")

    def __str__(self):
        return f'{self.customer.username}'

    # @property
    # def total_price(self):
    #     total_price = 0
    #     for item in self.items.all():
    #         total_price += item.product.price * item.quantity
    #     return total_price

    @property
    def total_price_with_discount(self):
        if DiscountCode.objects.filter(product=self).count() > 0:
            total_price_with_discount = int(self.total_price - (self.total_price * DiscountCode.amount / 100))
            return total_price_with_discount
