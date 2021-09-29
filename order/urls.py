from django.urls import path
from .views import recent_orders_view, orders_history_view

urlpatterns = [
    path('orders-history/', orders_history_view, name='orders_history'),
    path('recent-orders/', recent_orders_view, name='recent_orders'),
]
