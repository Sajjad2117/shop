from order.api.serializers import DiscountSerializer
from rest_framework import viewsets
from rest_framework.generics import ListAPIView

from order.models import DiscountCode


class DiscountView(ListAPIView):
    # queryset = DiscountCode.objects.filter(customer=request.user)
    serializer_class = DiscountSerializer

    def get_queryset(self):
        queryset = DiscountCode.objects.filter(customer=self.request.user)

        return queryset

