import sys
import os

# Add the project root to Python's path
project_root = os.path.abspath(os.path.join(os.path.dirname(__file__), "../.."))
sys.path.insert(0, project_root)

# Now we can import from PrologInterface
from PrologInterface import PrologInterface

def main():
    # Get the current directory
    current_dir = os.getcwd()
    prolog_file = os.path.join(current_dir, "test\prolog_interface_test\calculator.pl")
    
    print(f"Looking for calculator.pl at: {prolog_file}")
    
    # Initialize the Prolog interface
    prolog = PrologInterface(prolog_file)
    
    print("Testing Prolog Interface")
    a = int(input("Enter first number: "))
    b = int(input("Enter second number: "))
    # Simple addition test with debug output
    query = f"subtract({a},{b},Result), write(Result)."
    result = prolog.query(query, debug=False)
    print(f"Result: {result}")
    


if __name__ == "__main__":
    main()