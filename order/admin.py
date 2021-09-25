from django.contrib import admin
from .models import DiscountCode, Order, OrderHistory

admin.site.register(DiscountCode)
admin.site.register(Order)
admin.site.register(OrderHistory)