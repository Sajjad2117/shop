from rest_framework import serializers
from rest_framework.authtoken.models import Token
from django.db.models import Q
from django.conf import settings

from customer.models import Customer


class UserRegistrationSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(required=True,
                                   label="Email Address",
                                   # validators=[validate_email],
                                   )
    password = serializers.CharField(required=True,
                                     label="Password",
                                     style={'input_type': 'password'}
                                     )
    password_2 = serializers.CharField(required=True,
                                       label="Confirm Password",
                                       style={'input_type': 'password'}
                                       )
    name = serializers.CharField(required=True)

    class Meta(object):
        model = Customer
        fields = ['id', 'email', 'name', 'password', 'password_2']

    def validate_email(self, value):
        if Customer.objects.filter(email=value).exists():
            raise serializers.ValidationError("Email already exists.")
        return value

    def validate_password(self, value):
        if len(value) < getattr(settings, 'PASSWORD_MIN_LENGTH', 8):
            raise serializers.ValidationError(
                "Password should be at least %s characters long." % getattr(settings, 'PASSWORD_MIN_LENGTH', 8)
            )
        return value

    def validate_password_2(self, value):
        data = self.get_initial()
        password = data.get('password')
        if password != value:
            raise serializers.ValidationError("Passwords doesn't match.")
        return value


class UserLoginSerializer(serializers.ModelSerializer):
    name = serializers.CharField(required=False,
                                 allow_blank=True,
                                 write_only=True,
                                 )
    email = serializers.EmailField(required=False,
                                   allow_blank=True,
                                   write_only=True,
                                   label="Email Address"
                                   )
    token = serializers.CharField(allow_blank=True,
                                  read_only=True
                                  )

    password = serializers.CharField(required=True,
                                     write_only=True,
                                     style={'input_type': 'password'}
                                     )

    class Meta(object):
        model = Customer
        fields = ['email', 'name', 'password', 'token']

    def validate(self, data):
        email = data.get('email', None)
        password = data.get('password', None)

        if not email:
            raise serializers.ValidationError("Please enter email to login.")

        user = Customer.objects.filter(
            Q(email=email)
        ).exclude(
            email__isnull=True
        ).exclude(
            email__iexact=''
        ).distinct()

        if user.exists() and user.count() == 1:
            user_obj = user.first()
        else:
            raise serializers.ValidationError("This email is not valid.")

        if user_obj:
            if not user_obj.check_password(password):
                raise serializers.ValidationError("Invalid credentials.")

        if user_obj.is_active:
            token, created = Token.objects.get_or_create(user=user_obj)
            data['token'] = token
        else:
            raise serializers.ValidationError("User not active.")

        return data


class PasswordResetSerializer(serializers.Serializer):
    email = serializers.EmailField(required=True)

    def validate_email(self, value):
        return value
