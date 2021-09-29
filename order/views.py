from datetime import date, timedelta

from django.shortcuts import render, redirect
from django.urls import reverse
from order.models import OrderHistory




# def orders_history_view(request):
#     if request.user.is_authenticated:
#         orders = OrderHistory.objects.all()
#
#         context = {
#             'orders': orders,
#         }
#         return render(request, 'orders_history.html', context)
#
#     return redirect(reverse("account_login"))
#
#
# def recent_orders_view(request):
#     if request.user.is_authenticated:
#         # orders in past 10 days
#         recent_orders = OrderHistory.objects.filter(order_date__range=(date.today() - timedelta(days=10), date.today()))
#
#         context = {
#             'recent_orders': recent_orders,
#         }
#         return render(request, 'recent_orders.html', context)
#
#     return redirect(reverse("account_login"))
