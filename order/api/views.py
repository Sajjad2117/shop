from order.models import DiscountCode

from order.api.serializers import DiscountSerializer
from rest_framework.generics import UpdateAPIView


class DiscountCodeApiView(UpdateAPIView):
    queryset = DiscountCode.objects.all().order_by('id')
    serializer_class = DiscountSerializer
