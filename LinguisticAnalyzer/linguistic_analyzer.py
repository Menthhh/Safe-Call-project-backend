import os
import sys
project_root = os.path.abspath(os.path.join(os.path.dirname(__file__), "../.."))
sys.path.insert(0, project_root)
from ThaiTextProcessor import ThaiTextProcessor
from PrologInterface import PrologInterface


class LinguisticAnalyzer:
    def __init__(self, paragraph=None, prolog_file="LinguisticAnalyzer\\thai_scam_detector.pl"):
        self.paragraph = paragraph
        self.thai_text_processor = ThaiTextProcessor()
        self.sentences = []  # List of sentences after separating the paragraph
        self.prolog_interface = PrologInterface(prolog_file)
        
    def tokenizeThaiText(self):
        """Process the paragraph and tokenize into sentences and words"""
        self.sentences = self.thai_text_processor.process_paragraph(self.paragraph)
        return self.sentences
        
    def detectScamSentence(self):
        """
        Detect potential scam sentences in the tokenized text using Prolog rules
        Returns a list of dictionaries with analysis results for each sentence
        """
        if not self.sentences:
            self.tokenizeThaiText()
        
        results = []
        
        for idx, tokens in enumerate(self.sentences):
            # Convert Python list to Prolog list format
            tokens_str = str(tokens).replace("'", '"').replace("[", "[").replace("]", "]")
            
            # Build the Prolog query
            query = f"analyze_with_confidence({tokens_str}, Results, Confidence)."
            
            # Execute the query
            result = self.prolog_interface.query(query)
            
            # Parse the Prolog output
            if result and result != "false.":
                # Extract meaningful data from the Prolog result
                result_data = self._parse_prolog_result(result)
                
                # Add sentence index and the original tokens
                result_data["sentence_idx"] = idx
                result_data["tokens"] = tokens
                
                results.append(result_data)
        
        return results
    
    def _parse_prolog_result(self, prolog_result):
        """Parse the Prolog output into a structured dictionary"""
        try:
            # This is a simplified parser - might need adjustment based on actual Prolog output format
            if "Confidence" in prolog_result:
                confidence = int(prolog_result.split("Confidence = ")[1].split(".")[0].strip())
            else:
                confidence = 0
                
            # Parse the scam rule results
            rules = []
            if "Results = [" in prolog_result:
                results_str = prolog_result.split("Results = [")[1].split("]")[0]
                rule_parts = results_str.split("scam(")
                
                for part in rule_parts:
                    if not part.strip():
                        continue
                    
                    # Extract rule name and explanation
                    rule_content = part.split(", ")[0].strip()
                    explanation = part.split("\"")[1].strip() if "\"" in part else ""
                    
                    rules.append({
                        "rule": rule_content,
                        "explanation": explanation
                    })
            
            return {
                "confidence": confidence,
                "rules": rules,
                "is_scam": confidence > 0
            }
            
        except Exception as e:
            # In case of parsing error, return a basic structure
            return {
                "confidence": 0,
                "rules": [],
                "is_scam": False,
                "parse_error": str(e)
            }
    
    def analyzeText(self):
        """Complete analysis of the text"""
        self.tokenizeThaiText()
        scam_results = self.detectScamSentence()
        
        return {
            "sentences": self.sentences,
            "scam_analysis": scam_results
        }