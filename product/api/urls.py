from django.urls import path

from product.api.views import PaginationView


urlpatterns = [
    path('', PaginationView.as_view(), name='product-list'),
]
