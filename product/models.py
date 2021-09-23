from django.db import models
from mptt.models import MPTTModel, TreeForeignKey


class Category(MPTTModel):
    name = models.CharField(max_length=200, unique=True)
    parent = TreeForeignKey('self', on_delete=models.CASCADE, null=True, blank=True, related_name='children')
    slug = models.SlugField()

    class MPTTMeta:
        order_insertion_by = ['name']
        # verbose_name = 'category'
        # verbose_name_plural = "Categories"

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        super(Category, self).save(*args, **kwargs)


class Product(models.Model):
    category = models.ForeignKey(Category, on_delete=models.CASCADE, related_name='products')
    title = models.CharField(max_length=200)
    slug = models.SlugField()
    description = models.TextField(max_length=1000, default="About product")
    price = models.DecimalField(max_digits=6, decimal_places=2)
    image = models.ImageField(upload_to='product', null=True, blank=True)
    number = models.PositiveSmallIntegerField(blank=True, null=True)
    date_added = models.DateTimeField(auto_now_add=True)
    date_updated = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ('-date_added',)
        verbose_name = 'product'
        verbose_name_plural = 'products'

    def __str__(self):
        return self.title

    @property
    def get_price(self):
        if Discount.objects.filter(product=self).count() > 0:
            discount = Discount.objects.filter(product=self).last()
            return self.price * discount
        return self.price


class Discount(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    discount = models.DecimalField(max_digits=6, decimal_places=2)

    class Meta:
        verbose_name = "Discount"
        verbose_name_plural = "Discounts"
