import os
import sys

# Add the project root to Python's path
project_root = os.path.abspath(os.path.join(os.path.dirname(__file__), "../.."))
sys.path.insert(0, project_root)

# Import the analyzer
from LinguisticAnalyzer import LinguisticAnalyzer

def test_word_detection():
    # Sample Thai paragraph to test
    paragraph = "โทรมาจากธนาคารกรุงไทย กรุณาให้ข้อมูลบัญชีของคุณทันที"

    # Initialize the LinguisticAnalyzer with the paragraph
    analyzer = LinguisticAnalyzer(paragraph=paragraph)
    results = analyzer.apply_rules()
    
    print("Test results:")
    print(results)
if __name__ == "__main__":
    test_word_detection()
