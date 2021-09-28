from django.conf import settings
from rest_framework import generics, permissions, status, views
from rest_framework.exceptions import ValidationError
from rest_framework.generics import CreateAPIView
from rest_framework.permissions import AllowAny
from rest_framework.renderers import JSONRenderer
from rest_framework.response import Response
from rest_framework.views import APIView

from . import serializers

from customer.models import Customer

from .serializers import UserRegisterSerializer, UserSerializer


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


class RegisterView(CreateAPIView):
    serializer_class = UserRegisterSerializer
    permission_classes = (AllowAny,)
    queryset = Customer.objects.all()


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
