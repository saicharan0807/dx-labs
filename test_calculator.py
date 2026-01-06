import unittest
from calculator import add, subtract, multiply, divide

class TestCalculator(unittest.TestCase):
    
    def test_add(self):
        self.assertEqual(add(5, 3), 8)
        self.assertEqual(add(-1, 1), 0)
    
    def test_subtract(self):
        self.assertEqual(subtract(10, 4), 6)
        self.assertEqual(subtract(0, 5), -5)
    
    def test_multiply(self):
        self.assertEqual(multiply(3, 7), 21)
        self.assertEqual(multiply(-2, 3), -6)
    
    def test_divide(self):
        self.assertEqual(divide(15, 3), 5)
        self.assertEqual(divide(10, 2), 5)
    
    def test_divide_by_zero(self):
        with self.assertRaises(ValueError):
            divide(10, 0)

if __name__ == '__main__':
    unittest.main()
