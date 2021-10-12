from django.test import TestCase
from customer.models import Customer, Address


class TestCustomerModel(TestCase):
    def setUp(self):
        self.customer = Customer.objects.create_user(
            username='sajjad',
            first_name='Sajjad',
            last_name='Yadollahzadeh',
            phone_number='09149202645',
            email='sajjad@gmail.com',
            password='password',
        )

    def test_customer_is_created(self):
        self.assertEqual(str(self.customer), 'Sajjad')


class TestAddressModel(TestCase):

    def setUp(self):
        customer = Customer.objects.create_user(
            username='sajjad',
            first_name='Sajjad',
            last_name='Yadollahzadeh',
            phone_number='09149202645',
            email='sajjad@gmail.com',
            password='password',
        )

        self.address = Address.objects.create(
            customer=customer,
            country='Iran',
            province='East Azerbaijan',
            city='Ajabshir',
            postcode='55471',
            address_line='123 Main Street Room 22',
        )

    def test_address_is_created(self):
        self.assertEqual(str(self.address_line), '123 Main Street Room 22')
