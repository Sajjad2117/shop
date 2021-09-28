from rest_framework import serializers
from rest_framework.authtoken.models import Token
from django.db.models import Q
from django.conf import settings
from django.utils.translation import gettext_lazy as _

from customer.models import Customer


class RegisterSerializer(serializers.Serializer):
    username = serializers.CharField(max_length=70, label=_('username'))
    password = serializers.CharField(min_length=6, max_length=100, label=_('password'))
    confirm_password = serializers.CharField(min_length=6, max_length=100, label=_('confirm_password'), write_only=True)
    email = serializers.EmailField(max_length=70, label=_('email address'))

    def create(self, validated_data):
        user = Customer.objects.create_user(username=validated_data['username'],
                                            email=validated_data['email'])
        user.set_password(validated_data['password'])
        user.save()
        return validated_data

    def validate(self, attrs):
        username = attrs['username']
        password = attrs['password']
        email = attrs['email']
        confirm_password = attrs['confirm_password']
        if Customer.objects.filter(username=username).exists():
            raise serializers.ValidationError(_('Username already exist'))
        elif Customer.objects.filter(email=email).exists():
            raise serializers.ValidationError(_('Emil already exist'))
        elif password != confirm_password:
            raise serializers.ValidationError(_('Password fields didn’t match'))
        return attrs

# class ResetPasswordEmailRequestSerializer(serializers.Serializer):
#     email = serializers.EmailField(min_length=2)
#
#     class Meta:
#         fields = ['email']
#
#
# class SetNewPasswordSerializer(serializers.Serializer):
#     password = serializers.CharField(min_length=6,
#                                      max_length=100, write_only=True)
#     token = serializers.CharField(min_length=1, write_only=True)
#     uidb64 = serializers.CharField(min_length=1, write_only=True)
#
#     class Meta:
#         fields = ['password', 'token', 'uidb64']
#
#     def validate(self, attrs):
#         try:
#             password = attrs['password']
#             token = attrs['token']
#             uidb64 = attrs['uidb64']
#             id = force_str(urlsafe_base64_decode(uidb64))
#             customer = Customer.objects.get(id=id)
#             if not PasswordResetTokenGenerator().check_token(customer, token):
#                 raise AuthenticationFailed('the reset link is invalid', 401)
#             customer.set_password(password)
#             customer.save()
#         except Exception as e:
#             raise AuthenticationFailed('the reset link is invalid', 401)
#         return super().validate(attrs)
#
#
# class SetChangePasswordSerializer(serializers.Serializer):
#     username = serializers.CharField(max_length=70, label=_('username'))
#     old_password = serializers.CharField(min_length=6, max_length=100, write_only=True)
#     new_password1 = serializers.CharField(min_length=6, max_length=100, write_only=True)
#     new_password2 = serializers.CharField(min_length=6, max_length=100, write_only=True)
#
#     class Meta:
#         fields = ['username', 'old_password', 'new_password1', 'new_password2']
#
#     def validate(self, attrs):
#         if attrs['new_password1'] != attrs['new_password2']:
#             raise serializers.ValidationError({"matching": _("Password fields didn't match.")})
#
#         return super().validate(attrs)


# class UserSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Customer
#         fields = ('id', 'username', 'email')


# class UserRegisterSerializer(serializers.ModelSerializer):
#     confirm_password = serializers.CharField(write_only=True, style={'input_type': 'password'})
#
#     class Meta:
#         model = Customer
#         fields = ['username', 'password', 'confirm_password']
#
#         extra_kwargs = {'password': {'write_only': True}}
#
#     def save(self):
#         user = Customer(username=self._validated_data['username'], )
#         password = self.validated_data['password']
#         confirm_password = self.validated_data['confirm_password']
#
#         if password != confirm_password:
#             raise serializers.ValidationError({'password': _("Passwords doesn't match.")})
#
#         elif len(password) < 8:
#             raise serializers.ValidationError({'password': _('Your password must be at least 8 characters long.')})
#
#         user.set_password(password)
#         user.save()
#         return user


# class UserRegisterSerializer(serializers.Serializer):
#     username = serializers.CharField(required=True,
#                                      max_length=100,
#                                      label=_('Username'), )
#     email = serializers.EmailField(required=True,
#                                    max_length=100,
#                                    label=_('Email Address'), )
#     password = serializers.CharField(required=True,
#                                      min_length=6, max_length=100,
#                                      label=_('Password'),
#                                      style={'input_type': 'password'}, )
#     confirm_password = serializers.CharField(required=True,
#                                              min_length=6, max_length=100,
#                                              label=_('Confirm Password'),
#                                              style={'input_type': 'password'},
#                                              write_only=True, )
#
#     def create(self, validated_data):
#         user = Customer.objects.create_user(username=validated_data['username'],
#                                             email=validated_data['email'])
#         user.set_password(validated_data['password'])
#         user.save()
#         return validated_data
#
#     def validate(self, attrs):
#         username = attrs['username']
#         password = attrs['password']
#         email = attrs['email']
#         confirm_password = attrs['confirm_password']
#         if Customer.objects.filter(username=username).exists():
#             raise serializers.ValidationError(_('Username already exist'))
#         elif Customer.objects.filter(email=email).exists():
#             raise serializers.ValidationError(_("Email already exists."))
#         elif password != confirm_password:
#             raise serializers.ValidationError(_("Passwords doesn't match."))
#         return attrs


# class UserLoginSerializer(serializers.ModelSerializer):
#     name = serializers.CharField(required=False,
#                                  allow_blank=True,
#                                  write_only=True,
#                                  )
#     email = serializers.EmailField(required=False,
#                                    allow_blank=True,
#                                    write_only=True,
#                                    label="Email Address"
#                                    )
#     token = serializers.CharField(allow_blank=True,
#                                   read_only=True
#                                   )
#
#     password = serializers.CharField(required=True,
#                                      write_only=True,
#                                      style={'input_type': 'password'}
#                                      )
#
#     class Meta(object):
#         model = Customer
#         fields = ['email', 'name', 'password', 'token']
#
#     def validate(self, data):
#         email = data.get('email', None)
#         password = data.get('password', None)
#
#         if not email:
#             raise serializers.ValidationError("Please enter email to login.")
#
#         user = Customer.objects.filter(
#             Q(email=email)
#         ).exclude(
#             email__isnull=True
#         ).exclude(
#             email__iexact=''
#         ).distinct()
#
#         if user.exists() and user.count() == 1:
#             user_obj = user.first()
#         else:
#             raise serializers.ValidationError("This email is not valid.")
#
#         if user_obj:
#             if not user_obj.check_password(password):
#                 raise serializers.ValidationError("Invalid credentials.")
#
#         if user_obj.is_active:
#             token, created = Token.objects.get_or_create(user=user_obj)
#             data['token'] = token
#         else:
#             raise serializers.ValidationError("User not active.")
#
#         return data


# class PasswordResetSerializer(serializers.Serializer):
#     email = serializers.EmailField(required=True)
#
#     def validate_email(self, value):
#         return value
