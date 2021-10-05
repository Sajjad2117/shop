from django.urls import path


from order.api.views import DiscountCodeApiView

urlpatterns = [
    path('discount-code/',  DiscountCodeApiView.as_view(), name='discount-code-api'),
]
