from datetime import date, timedelta
from django.shortcuts import render, redirect
from django.urls import reverse
from django.shortcuts import render, redirect, get_object_or_404
from django.views.decorators.http import require_POST

from order.models import Order
from product.models import Product



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


# @require_POST
# def cart_add_view(request, product_id):
#     cart = Cart(request)
#     product = get_object_or_404(Product, id=product_id)
#     form = CartAddProductForm(request.POST)
#     if form.is_valid():
#         cd = form.cleaned_data
#         cart.add(product=product, quantity=cd['quantity'], update_quantity=cd['update'])
#     return redirect('cart_detail')
#
#
# def cart_remove_view(request, product_id):
#     cart = Cart(request)
#     product = get_object_or_404(Product, id=product_id)
#     cart.remove(product)
#     return redirect('cart_detail')
#
#
# def cart_detail_view(request):
#     cart = Cart(request)
#     products = []
#     for item in cart:
#         item['update_quantity_form'] = CartAddProductForm(initial={'quantity': item['quantity'], 'update': True})
#         products.append(item)
#     context = {'cart': cart}
#     context['products'] = products
#     return render(request, 'cart_detail.html', context)
