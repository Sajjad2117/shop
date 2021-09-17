from django.conf import settings
from django.db import models
from django.utils.translation import gettext_lazy as _
from product.models import Product


class Order(models.Model):
    READY_TO_SEND = 'ready_to_send'
    SENDING = 'sending'
    SENT = 'sent'
    STATUS = [
        (READY_TO_SEND, _('ready_to_send')),
        (SENDING, _('sending')),
        (SENT, _('sent')),
    ]
    customer = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='order_user')
    address = models.TextField(max_length=200)
    city = models.CharField(max_length=100)
    phone = models.CharField(max_length=100)
    post_code = models.CharField(max_length=20)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    paid_amount = models.DecimalField(max_digits=8, decimal_places=2, blank=True, null=True)
    billing_status = models.BooleanField(default=False)
    status = models.CharField(max_length=20, choices=STATUS)

    class Meta:
        ordering = ('-created',)

    def __str__(self):
        return str(self.created)


class OrderItem(models.Model):
    order = models.ForeignKey(Order, related_name='items', on_delete=models.CASCADE)
    product = models.ForeignKey(Product, related_name='order_items', on_delete=models.CASCADE)
    price = models.DecimalField(max_digits=8, decimal_places=2)
    quantity = models.PositiveIntegerField(default=1)

    def __str__(self):
        return str(self.id)
