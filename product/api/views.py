from rest_framework import generics
from rest_framework.generics import ListAPIView
from rest_framework.pagination import PageNumberPagination

from .serializers import ProductSerializer
from product.models import Product


class PaginationView(ListAPIView):
    queryset = Product.objects.filter(is_active=True)
    serializer_class = ProductSerializer
    pagination_class = PageNumberPagination

    def get_queryset(self):
        queryset = Product.objects.filter(is_active=True)
        category = self.request.query_params.get('category')
        if category is not None:
            queryset = queryset.filter(category__name=category)
        return queryset
