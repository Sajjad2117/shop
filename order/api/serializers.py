from django.utils.timezone import now
from rest_framework import serializers

from order.models import DiscountCode


# class DiscountSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = DiscountCode
#         fields = '__all__'


class DiscountSerializer(serializers.ModelSerializer):
    """
    Discount serializer.
    """
    def validate(self, data):

        # Verify if the expiration date is set that it's in the future.
        if 'expire_date' in data:
            if data['expire_date'] < now():
                raise serializers.ValidationError("Expiration date set in the past.")

        return data

    def create(self, validated_data):
        return DiscountCode.objects.create(**validated_data)

    class Meta:
        model = DiscountCode
        fields = '__all__'
