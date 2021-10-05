from order.models import DiscountCode
from order.api.serializers import DiscountSerializer
from rest_framework.generics import  ListAPIView


class DiscountView(ListAPIView):
    queryset = DiscountCode.objects.filter(is_active=True).order_by('id')
    serializer_class = DiscountSerializer

    def get_queryset(self):
        queryset = DiscountCode.objects.filter(is_active=True).order_by('id')

        return queryset
