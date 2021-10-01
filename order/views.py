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

from order.cart import Cart


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


@require_POST
def cart_add_view(request, product_id):
    cart = Cart(request)
    product = get_object_or_404(Product, id=product_id)
    form = CartAddProductForm(request.POST)
    if form.is_valid():
        cd = form.cleaned_data
        cart.add(product=product, quantity=cd['quantity'], update_quantity=cd['update'])
    return redirect('cart_detail')
#
#
def cart_remove_view(request, product_id):
    cart = Cart(request)
    product = get_object_or_404(Product, id=product_id)
    cart.remove(product)
    return redirect('cart_detail')
#
#
def cart_detail_view(request):
    cart = Cart(request)
    products = []
    for item in cart:
        item['update_quantity_form'] = CartAddProductForm(initial={'quantity': item['quantity'], 'update': True})
        products.append(item)
    context = {'cart': cart}
    context['products'] = products
    return render(request, 'cart_detail.html', context)


# stripe.api_key = settings.STRIPE_SECRET_KEY
#
#
# def get_user_pending_order(request):
#     # get order for the correct user
#     user_profile = get_object_or_404(Customer, user=request.user)
#     order = Order.objects.filter(owner=user_profile)
#     if order.exists():
#         # get the only order in the list of filtered orders
#         return order[0]
#     return 0
#
#
# @login_required()
# def add_to_cart(request, **kwargs):
#     # get the user profile
#     user_profile = get_object_or_404(Customer, user=request.user)
#     # filter products by id
#     product = Product.objects.filter(id=kwargs.get('item_id', "")).first()
#     # create orderItem of the selected product
#     order_item, status = OrderItem.objects.get_or_create(product=product)
#     # create order associated with the user
#     user_order, status = Order.objects.get_or_create(owner=user_profile)
#     user_order.items.add(order_item)
#     if status:
#         # generate a reference code
#         user_order.ref_code = generate_order_id()
#         user_order.save()
#
#     # show confirmation message and redirect back to the same page
#     messages.info(request, "item added to cart")
#     return redirect(reverse('products:index'))
#
#
# @login_required()
# def delete_from_cart(request, item_id):
#     item_to_delete = OrderItem.objects.filter(pk=item_id)
#     if item_to_delete.exists():
#         item_to_delete[0].delete()
#         messages.info(request, "Item has been deleted")
#     return redirect(reverse('order:order_summary'))
#
#
# @login_required()
# def order_details(request, **kwargs):
#     existing_order = get_user_pending_order(request)
#     context = {
#         'order': existing_order
#     }
#     return render(request, 'order/order_summary.html', context)


def success(request, **kwargs):
    # a view signifying the transcation was successful
    return render(request, 'order/purchase_success.html', {})
