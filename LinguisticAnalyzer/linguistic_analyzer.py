import os
import sys
project_root = os.path.abspath(os.path.join(os.path.dirname(__file__), "../.."))
sys.path.insert(0, project_root)
from ThaiTextProcessor import ThaiTextProcessor
from PrologInterface import PrologInterface


class LinguisticAnalyzer:
    def __init__(self, paragraph=None, prolog_file="LinguisticAnalyzer\\rules.pl"):
        self.paragraph = paragraph
        self.thai_text_processor = ThaiTextProcessor()
        self.sentences = []  
        self.prolog_interface = PrologInterface(prolog_file)
        
    def tokenizeThaiText(self):
        """Process the paragraph and tokenize into sentences and words"""
        self.sentences = self.thai_text_processor.process_paragraph(self.paragraph)
        return self.sentences
        
    def apply_rules(self):
        self.tokenizeThaiText()
        print(f"Tokenized sentences: {self.sentences}")

        """Apply Prolog rules to the tokenized sentences"""
        if not self.sentences:
            raise ValueError("No sentences to process. Please tokenize the text first.")
        
        prolog_sentence_format = [[word for word in sentence] for sentence in self.sentences]
        
        query = f"analyze_message({prolog_sentence_format})."
        
        results = self.prolog_interface.query(query)
        
        return results
        
    
