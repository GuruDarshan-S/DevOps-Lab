import unittest
from app import app

class TestSecureApp(unittest.TestCase):
    def setUp(self):
        self.client = app.test_client()

    def test_home(self):
        res = self.client.get('/')
        self.assertEqual(res.status_code, 200)

if __name__ == '__main__':
    unittest.main()
