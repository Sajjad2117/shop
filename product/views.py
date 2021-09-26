from django.shortcuts import render, get_object_or_404
from django.views import generic

from .models import Product, Category


class IndexView(generic.ListView):
    template_name = 'product/index.html'
    context_object_name = 'product_list'

    def get_queryset(self):
        return Product.objects.order_by('name')[:4]


class DetailView(generic.DetailView):
    model = Product
    template_name = 'product/detail.html'
    context_object_name = 'products'


def product_category(request, pk):
    category = get_object_or_404(Category, pk=pk)
    return render(request, 'products/index.html', context={'category': category})
