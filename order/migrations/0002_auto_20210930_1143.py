# Generated by Django 3.2.7 on 2021-09-30 08:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0002_remove_category_parent'),
        ('order', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='OrderItem',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('quantity', models.IntegerField(default=1, verbose_name='quantity')),
                ('product', models.ManyToManyField(to='product.Product')),
            ],
            options={
                'verbose_name': 'Order item',
                'verbose_name_plural': 'Order items',
            },
        ),
        migrations.RemoveField(
            model_name='discountcode',
            name='active',
        ),
        migrations.RemoveField(
            model_name='order',
            name='address',
        ),
        migrations.RemoveField(
            model_name='order',
            name='product',
        ),
        migrations.RemoveField(
            model_name='order',
            name='quantity',
        ),
        migrations.AddField(
            model_name='discountcode',
            name='is_active',
            field=models.BooleanField(default=True),
        ),
        migrations.AlterField(
            model_name='order',
            name='status',
            field=models.CharField(choices=[('ready to send', 'ready to send'), ('sending', 'sending'), ('delivered', 'delivered')], default='ready to send', max_length=30),
        ),
        migrations.DeleteModel(
            name='OrderHistory',
        ),
        migrations.AddField(
            model_name='order',
            name='products',
            field=models.ManyToManyField(to='order.OrderItem'),
        ),
    ]