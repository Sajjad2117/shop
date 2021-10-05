from django.urls import path

from order.api.views import DiscountView

urlpatterns = [
    # path('discount-code/', DiscountCodeApiView.as_view(), name='discount-code-api'),
    # path('discount-code/', DiscountViewSet, name='discount-code-api'),
    path('discount-code/', DiscountView.as_view(), name='discount-code-api'),
]
