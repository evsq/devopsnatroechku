from calculator import Calculator

def main():
    print("🚀 Python CI/CD Demo Application")
    calc = Calculator()
    
    a, b = 10, 5
    print(f"{a} + {b} = {calc.add(a, b)}")
    print(f"{a} - {b} = {calc.subtract(a, b)}")
    print(f"{a} * {b} = {calc.multiply(a, b)}")
    print(f"{a} / {b} = {calc.divide(a, b)}")
    
    print("✅ Application started successfully!")

if __name__ == "__main__":
    main()