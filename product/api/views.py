from rest_framework.generics import ListAPIView
from rest_framework.pagination import PageNumberPagination

from .serializers import ProductSerializer
from product.models import Product


class LargeResultsSetPagination(PageNumberPagination):
    page_size = 3
    page_size_query_param = 'page_size'
    max_page_size = 3


class PaginationView(ListAPIView):
    queryset = Product.objects.filter(is_active=True)
    serializer_class = ProductSerializer
    pagination_class = LargeResultsSetPagination

    def get_queryset(self):
        queryset = Product.objects.filter(is_active=True)
        category = self.request.query_params.get('category')
        if category is not None:
            queryset = queryset.filter(category__name=category)
        return queryset
