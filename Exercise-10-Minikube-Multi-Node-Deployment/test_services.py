import unittest
from product_catalog import app as product_app
from shopping_cart import app as cart_app

class TestMultiNodeApps(unittest.TestCase):
    def setUp(self):
        self.prod_client = product_app.test_client()
        self.cart_client = cart_app.test_client()

    def test_products(self):
        res = self.prod_client.get("/products")
        self.assertEqual(res.status_code, 200)

    def test_cart(self):
        res = self.cart_client.get("/cart")
        self.assertEqual(res.status_code, 200)

if __name__ == '__main__':
    unittest.main()
