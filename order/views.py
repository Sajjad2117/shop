from datetime import date, timedelta

from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import render, redirect
from django.urls import reverse
from django.views import View
from order.models import  Order


class OrderHistoryView(LoginRequiredMixin, View):

    def get(self, request, *args, **kwargs):
        try:
            orders_history = Order.objects.filter(order__customer__id=request.user.id)
        except OrderHistory.DoesNotExist:
            return redirect(reverse("customer:login"))
        return render(request, "orders/orders_history.html", {
            'orders_history': orders_history,
        })


class RecentOrdersView(LoginRequiredMixin, View):

    def get(self, request, *args, **kwargs):
        try:
            recent_orders = Order.objects.filter(customer__id=request.user.id)[0:10]
        except OrderHistory.DoesNotExist:
            return redirect(reverse("customer:login"))
        return render(request, "orders/recent_orders.html", {
            'recent_orders': recent_orders,
        })
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
