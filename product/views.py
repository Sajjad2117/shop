from django.shortcuts import render
from django.views import generic

from .models import Product


class IndexView(generic.ListView):
    template_name = 'product/index.html'
    context_object_name = 'product_list'

    def get_queryset(self):
        return Product.objects.order_by('title')[:10]


class DetailView(generic.DetailView):
    model = Product
    template_name = 'product/detail.html'
    context_object_name = 'product'
