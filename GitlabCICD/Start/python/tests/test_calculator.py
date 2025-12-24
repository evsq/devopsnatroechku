import pytest
import sys
import os
sys.path.append(os.path.join(os.path.dirname(__file__), '..'))

from app.calculator import Calculator

class TestCalculator:
    def setup_method(self):
        self.calc = Calculator()
    
    def test_add(self):
        assert self.calc.add(2, 3) == 5
        assert self.calc.add(-1, 1) == 0
    
    def test_subtract(self):
        assert self.calc.subtract(5, 3) == 2
        assert self.calc.subtract(0, 5) == -5
    
    def test_multiply(self):
        assert self.calc.multiply(3, 4) == 12
        assert self.calc.multiply(-2, 3) == -6
    
    def test_divide(self):
        assert self.calc.divide(10, 2) == 5
        assert self.calc.divide(5, 2) == 2.5
    
    def test_divide_by_zero(self):
        with pytest.raises(ValueError, match="Cannot divide by zero!"):
            self.calc.divide(10, 0)