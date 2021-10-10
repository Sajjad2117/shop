from datetime import timedelta, datetime
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect

from product.models import Product
from customer.models import Customer, Address
from order.models import DiscountCode, Order, OrderItem


@login_required
def orders_history_view(request):
    orders = Order.objects.filter(customer=request.user).all()
    order_list = dict()
    for order in orders:
        product_list = list()
        for product_name in order.products.all():
            product = Product.objects.filter(name=product_name).first()
            product_list.append(product)

        order_list[order] = product_list

    context = {
        'order_list': order_list,
    }
    return render(request, 'orders_history.html', context)


@login_required
def recent_orders_view(request):
    recent_orders = Order.objects.filter(customer=request.user,
                                         created__range=[(datetime.now() - timedelta(days=10)), datetime.now()])
    order_list = dict()
    for order in recent_orders:
        product_list = list()
        for product_name in order.products.all():
            product = Product.objects.filter(name=product_name).first()
            product_list.append(product)

        order_list[order] = product_list
    context = {
        'order_list': order_list,
    }
    return render(request, 'recent_orders.html', context)


def cart_detail_view(request):
    basket = request.session['basket']
    products = dict()
    total_price = list()
    for item in basket:
        product = Product.objects.filter(id=item).first()
        products[product] = basket[item]

    for product.id, quantity in basket.items():
        product = Product.objects.get(id=product.id)
        total_price.append(int(product.price * int(quantity)))

    total_price = (sum(total_price))
    context = {
        'products': products,
        'total_price': total_price,
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
    return render(request, 'purchase_success.html', {})


@login_required
def checkout_view(request):
    if request.method == 'GET':
        customer = Customer.objects.get(id=request.user.id)
        addresses = Address.objects.filter(customer=customer)
        basket = request.session['basket']
        products = dict()
        total_price = list()
        for item in basket:
            product = Product.objects.filter(id=item).first()
            products[product] = basket[item]

        for product.id, quantity in basket.items():
            product = Product.objects.get(id=product.id)
            total_price.append(int(product.price * int(quantity)))

        total_price = (sum(total_price))
        context = {
            'products': products,
            'addresses': addresses,
            'customer': customer,
            'total_price': total_price,
        }
        return render(request, 'checkout.html', context)

    if request.method == 'POST':
        basket = request.session['basket']
        # customer = request.user
        customer = Customer.objects.get(id=request.user.id)
        address = Address.objects.get(id=request.POST['address_id'])
        products = dict()
        total_price = list()

        for item in basket:
            product = Product.objects.filter(id=item).first()
            products[product] = basket[item]

        for product.id, quantity in basket.items():
            product = Product.objects.get(id=product.id)
            total_price.append(int(product.price * int(quantity)))

        total_price = (sum(total_price))

        if request.POST.get('discount_code'):
            discount = DiscountCode.objects.get(code=request.POST.get('discount_code'))
            total_price_with_discount = total_price - (total_price * int(discount.amount)) / 100
        else:
            discount = None
            total_price_with_discount = total_price

        order = Order(customer=customer,
                      address=address,
                      discount=discount,
                      status="ready to send",
                      )
        order.save()
        print(basket)
        for product.id, quantity in basket.items():
            product = Product.objects.get(id=product.id)
            order_item = OrderItem(product=product.name,
                                   quantity=quantity,
                                   )
            print(order_item)
            order_item.save()
            print(order_item, "++")
            order.products.add(order_item)

        del request.session['basket']
        return render(request, 'purchase_success.html')
