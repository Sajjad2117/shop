from django.db import models

from product.models import Product
from customer.models import Customer


class OrderItem(models.Model):
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, related_name='items')
    product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='items')
    price = models.DecimalField(max_digits=8, decimal_places=2)
    quantity = models.IntegerField(default=1)

    def __str__(self):
        return f'{self.customer} - {self.product}'
