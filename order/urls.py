from django.urls import path
from .views import (recent_orders_view,
                    orders_history_view,
                    success,
                    cart_add_view,
                    cart_detail_view,
                    cart_remove_view,
                    checkout_view,
                    )

app_name = 'order'

urlpatterns = [
    path('orders-history/', orders_history_view, name='orders_history'),
    path('recent-orders/', recent_orders_view, name='recent_orders'),
    path('cart/', cart_detail_view, name='cart'),
    path('cart-add/', cart_add_view, name='cart_add'),
    path('cart-remove/<int:product_id>/', cart_remove_view, name='cart_remove'),
    path('cart-success/', success, name='purchase_success'),
    path('checkout/', checkout_view, name='checkout'),
]
