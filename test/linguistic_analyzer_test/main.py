import os
import sys

# Add the project root to Python's path
project_root = os.path.abspath(os.path.join(os.path.dirname(__file__), "../.."))
sys.path.insert(0, project_root)

# Import the analyzer
from LinguisticAnalyzer import LinguisticAnalyzer

def test_word_detection():
    # Create test sentences with the exact words we're looking for
    test_sentences = [
        "นี่คือ ธนาคาร",           # Contains "ธนาคาร"
        "ฉันมี เงิน มาก",          # Contains "เงิน"
        "บัญชี ของฉัน",            # Contains "บัญชี"
        "นี่เป็นเรื่อง ด่วน มาก",   # Contains "ด่วน"
        "ไม่มีคำที่เราค้นหา"       # Contains none
    ]
   
    
    # Test each sentence
    for i, sentence in enumerate(test_sentences):
        print(f"\n{'='*80}")
        print(f"Testing sentence {i+1}: {sentence}")
        
        # Create analyzer
        analyzer = LinguisticAnalyzer(paragraph=sentence)

        
        # Call the simplified detection method
        scam_results = analyzer.detectScamSentence()
        
        print(scam_results)
    

if __name__ == "__main__":
    test_word_detection()