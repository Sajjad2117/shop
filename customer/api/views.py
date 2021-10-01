from django.conf import settings
from rest_framework import generics, permissions, status, views
from rest_framework.exceptions import ValidationError
from rest_framework.generics import CreateAPIView, UpdateAPIView
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.renderers import JSONRenderer
from rest_framework.response import Response
from rest_framework.views import APIView
from django.utils.translation import gettext_lazy as _

from . import serializers

from customer.models import Customer

from .serializers import RegisterSerializer, ChangePasswordSerializer


class RegisterAPIView(generics.ListCreateAPIView):
    queryset = Customer.objects.all()
    serializer_class = RegisterSerializer
    permission_classes = (AllowAny,)


# class ChangePasswordView(generics.GenericAPIView):
#     serializer_class = ChangePasswordSerializer
#
#     def patch(self, request):
#         username = request.data['username']
#         customer = Customer.objects.get(username=username)
#         serializer = self.get_serializer(data=request.data)
#         if not customer.check_password(request.data['old_password']):
#             return Response({"old_password": _("Wrong password.")}, status=status.HTTP_400_BAD_REQUEST)
#         if serializer.is_valid():
#             customer.set_password(request.data['new_password'])
#             customer.save()
#             response = {
#                 'status': 'success',
#                 'message': _('Password updated successfully'),
#             }
#
#             return Response(response, status=status.HTTP_200_OK)
#         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class ChangePasswordView(UpdateAPIView):
    serializer_class = ChangePasswordSerializer
    model = Customer
    permission_classes = (IsAuthenticated,)

    def get_object(self, queryset=None):
        obj = self.request.user
        return obj

    def update(self, request, *args, **kwargs):
        self.object = self.get_object()
        serializer = self.get_serializer(data=request.data)

        if serializer.is_valid():
            if not self.object.check_password(serializer.validated_data['old_password']):
                return Response({"password": ["Wrong password."]}, status=status.HTTP_400_BAD_REQUEST)

            elif len(serializer.validated_data['new_password']) < 8:
                return Response({"new_password": ["Your password must be at least 8 characters long."]},
                                status=status.HTTP_400_BAD_REQUEST)

            elif serializer.validated_data['new_password'] != serializer.validated_data['new_password_check']:
                return Response({"passwords": ["New password and New password check must match."]},
                                status=status.HTTP_400_BAD_REQUEST)

            self.object.set_password(serializer.validated_data['new_password'])
            self.object.save()

            response = {
                'status': 'success',
                'code': status.HTTP_200_OK,
                'message': 'Password updated successfully',
                'data': []
            }

            return Response(response)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

# class RegisterView(CreateAPIView):
#     renderer_classes = (JSONRenderer,)
#     permission_classes = (AllowAny,)
#     serializer_class = UserRegistrationSerializer
#
#     def perform_create(self, serializer):
#         """Override perform_create to create user"""
#         data = {
#             "email": serializer.validated_data["email"],
#             "name": serializer.validated_data["name"],
#             "password": serializer.validated_data["password"],
#         }
#         try:
#             data["mobile"] = serializer.validated_data["mobile"]
#         except KeyError:
#             if not settings.USER_SETTINGS["MOBILE_OPTIONAL"]:
#                 raise ValidationError({"error": "Mobile is required."})
#         return Customer.objects.create_user(**data)
#
#
# class LoginView(APIView):
#
#     renderer_classes = (JSONRenderer,)
#     permission_classes = (AllowAny,)
#     serializer_class = UserLoginSerializer
#
#     def post(self, request):
#         serializer = self.serializer_class(data=request.data)
#         if serializer.is_valid(raise_exception=True):
#             return Response(serializer.data, status=status.HTTP_200_OK)
#
#         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
#


# class UserRegisterAPIView(generics.GenericAPIView):
#     serializer_class = UserRegisterSerializer
#     permission_classes = (AllowAny,)
#     queryset = Customer.objects.all()
#
#     def post(self, request, *args, **kwargs):
#         serializer = self.get_serializer(data=request.data)
#         serializer.is_valid(raise_exception=True)
#         user = serializer.save()
#         return Response({
#             "user": UserSerializer(user, context=self.get_serializer_context()).data,
#         })

# class UserLoginAPIView(views.APIView):
#     permission_classes = (AllowAny, )
#     serializer_class = UserLoginSerializer
#
#     def post(self, request):
#         serializer = self.serializer_class(data=request.data)
#         if serializer.is_valid(raise_exception=True):
#             return Response(serializer.data, status=status.HTTP_200_OK)
#         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
