from django.test import TestCase
from customer.models import Customer


class TestLoginView(TestCase):
    def setUp(self):
        customer = Customer.objects.create(username='test', email='test@gmail.com', )
        customer.set_password('secret')

    def test_login(self):
        response = self.client.post('/customer/login/', {'username': 'sajjad', 'password': 'secret'})
        self.assertEqual(response.status_code, 200)
