from rest_framework import serializers

from order.models import DiscountCode


class DiscountSerializer(serializers.ModelSerializer):
    class Meta:
        model = DiscountCode
        fields = '__all__'
