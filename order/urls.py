from django.urls import path
from .views import recent_orders_view, orders_history_view, cart_detail_view, cart_add_view, cart_remove_view

urlpatterns = [
    path('orders-history/', orders_history_view, name='orders_history'),
    path('recent-orders/', recent_orders_view, name='recent_orders'),
    path('cart/', cart_detail_view, name='cart_detail'),
    path('cart/add/<int:product_id>/', cart_add_view, name='cart_add'),
    path('cart/remove/<int:product_id>/', cart_remove_view, name='cart_remove'),
]
