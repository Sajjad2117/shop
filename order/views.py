from datetime import date, timedelta

import stripe as stripe
from django.conf import settings
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.urls import reverse
from django.shortcuts import render, redirect, get_object_or_404
from django.views.decorators.http import require_POST

from order.models import Order, OrderItem
from product.models import Product

from customer.models import Customer
from order.extras import generate_order_id

from order.forms import CartAddProductForm


def orders_history_view(request):
    if request.user.is_authenticated:
        orders_history = Order.objects.all()
        context = {
            'orders_history ': orders_history,
        }
        return render(request, 'orders_history.html', context)
    return redirect(reverse("customer:login"))


def recent_orders_view(request):
    if request.user.is_authenticated:
        recent_orders = Order.objects.filter(created__range=(date.today() - timedelta(days=10), date.today()))
        context = {
            'recent_orders': recent_orders,
        }
        return render(request, 'recent_orders.html', context)
    return redirect(reverse("customer:login"))


def cart_detail_view(request):
    basket = request.session['basket']
    print(basket)
    product_list = dict()
    for item in basket:
        product = Product.objects.filter(id=item).first()
        product_list[product] = basket[item]

    print(product_list)

    context = {
        'products': product_list,
    }

    return render(request, 'cart.html', context)


def cart_add_view(request):
    product_id = request.POST['product-id']
    product_quantity = request.POST['product-quantity']

    if not request.session.get('basket'):
        request.session['basket'] = {
            product_id: product_quantity
        }
    else:
        cart = request.session.get('basket')
        cart[product_id] = product_quantity
        request.session.modified = True

    print(request.session.get('basket'))

    return redirect('order:cart')


def cart_remove_view(request, product_id):
    cart = request.session.get('basket')
    cart.pop(str(product_id))
    request.session.modified = True

    return redirect('order:cart')


def success(request, **kwargs):
    # a view signifying the transcation was successful
    return render(request, 'purchase_success.html', {})
