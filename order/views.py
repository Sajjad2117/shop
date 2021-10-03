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

from order.extras import generate_client_token

from order.extras import transact

from customer.models import Address

stripe.api_key = settings.STRIPE_SECRET_KEY


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
    product_list = dict()
    for item in basket:
        product = Product.objects.filter(id=item).first()
        product_list[product] = basket[item]
    context = {
        'products': product_list,
    }
    return render(request, 'cart.html', context)


def cart_add_view(request):
    product_id = request.POST['product-id']
    product_quantity = request.POST['product-quanity']
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


def get_user_pending_order(request):
    # get order for the correct user
    user_profile = get_object_or_404(Customer, user=request.user)
    order = Order.objects.filter(owner=user_profile, is_ordered=False)
    if order.exists():
        # get the only order in the list of filtered orders
        return order[0]
    return 0


# @login_required()
# def checkout(request, **kwargs):
#     client_token = generate_client_token()
#     existing_order = get_user_pending_order(request)
#     publishKey = settings.STRIPE_PUBLISHABLE_KEY
#     if request.method == 'POST':
#         token = request.POST.get('stripeToken', False)
#         if token:
#             charge = stripe.Charge.create(
#                 amount=100 * existing_order.get_cart_total(),
#                 currency='usd',
#                 description='Example charge',
#                 source=token,
#             )
#
#             return redirect(reverse('shopping_cart:update_records',
#                                     kwargs={
#                                         'token': token
#                                     })
#                             )
#
#         else:
#             result = transact({
#                 'amount': existing_order.get_cart_total(),
#                 'payment_method_nonce': request.POST['payment_method_nonce'],
#                 'options': {
#                     "submit_for_settlement": True
#                 }
#             })
#
#             if result.is_success or result.transaction:
#                 return redirect(reverse('shopping_cart:update_records',
#                                         kwargs={
#                                             'token': result.transaction.id
#                                         })
#                                 )
#
#     context = {
#         'order': existing_order,
#         'client_token': client_token,
#         'STRIPE_PUBLISHABLE_KEY': publishKey
#     }
#
#     return render(request, 'shopping_cart/checkout.html', context)


