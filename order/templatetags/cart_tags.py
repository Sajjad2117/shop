from django import template

from order.models import Order

register = template.Library()


@register.filter
def cart_item_count(user):
    if user.is_authenticated:
        return Order.objects.filter(customer__user=user)[0].items.count()
    return 0
