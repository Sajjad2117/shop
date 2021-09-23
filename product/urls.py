from django.urls import path

from .views import IndexView, DetailView

app_name = 'product'

urlpatterns = [
    path('', IndexView.as_view(), name='index'),
    path('products/detail/', DetailView.as_view(), name='product_detail'),

]
