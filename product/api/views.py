from rest_framework import generics
from rest_framework.pagination import PageNumberPagination

from .serializers import ProductSerializer
from product.models import Product


class LargeResultsSetPagination(PageNumberPagination):
    page_size = 3
    page_size_query_param = 'page_size'
    max_page_size = 3


class PaginationView(generics.ListAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
    pagination_class = LargeResultsSetPagination
