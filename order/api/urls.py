from django.urls import path

from order.api.views import DiscountView

urlpatterns = [
    path('discount-code/', DiscountView.as_view(), name='discount-code-api'),
]
