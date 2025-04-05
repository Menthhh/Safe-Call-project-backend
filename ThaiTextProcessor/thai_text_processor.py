import json
import re
from pythainlp import word_tokenize, sent_tokenize
from typing import List, Dict, Any

class ThaiTextProcessor:
    def __init__(self, word_engine="newmm"):
        """
        Initialize the Thai text processor that splits paragraphs into sentences and words
        
        Args:
            word_engine (str): Word tokenization engine to use ('newmm', 'dict', 'attacut', etc.)
        """
        self.word_engine = word_engine
    
    def split_into_sentences(self, paragraph: str) -> List[str]:
        """
        Split Thai paragraph into sentences
        
        Args:
            paragraph (str): Thai paragraph text
            
        Returns:
            List[str]: List of sentences
        """
        # ใช้ pythainlp sent_tokenize สำหรับแบ่งประโยค
        sentences = sent_tokenize(paragraph)
        
        # กรณีที่ sent_tokenize ไม่ทำงานได้ดีพอ สามารถใช้การแบ่งด้วย regex
        if not sentences or len(sentences) == 1 and len(paragraph) > 100:
            # Fallback: แบ่งด้วย regex ตามเครื่องหมายวรรคตอนทั่วไปในภาษาไทย
            sentences = re.split(r'[!?।|๏。\.\n]+', paragraph)
            # กรองประโยคที่ว่างเปล่าออก
            sentences = [s.strip() for s in sentences if s.strip()]
        
        return sentences
    
    def tokenize_words(self, sentence: str) -> List[str]:
        """
        Tokenize Thai sentence into words
        
        Args:
            sentence (str): Thai sentence
            
        Returns:
            List[str]: List of Thai words
        """
        tokens = word_tokenize(sentence, engine=self.word_engine)
        # กรองช่องว่างออก
        tokens = [token for token in tokens if token.strip()]
        return tokens
    
    def process_paragraph(self, paragraph: str) -> List[List[str]]:
        """
        Process a paragraph: split into sentences, then tokenize each sentence into words
        
        Args:
            paragraph (str): Thai paragraph
            
        Returns:
            List[List[str]]: List of sentences, where each sentence is a list of words
        """
        sentences = self.split_into_sentences(paragraph)
        result = []
        
        for sentence in sentences:
            if sentence.strip():  # ตรวจสอบว่าประโยคไม่ว่างเปล่า
                tokens = self.tokenize_words(sentence)
                result.append(tokens)
        
        return result
    
    def process_conversation(self, utterances: List[str]) -> List[List[List[str]]]:
        """
        Process a conversation: for each utterance, split into sentences and tokenize words
        
        Args:
            utterances (List[str]): List of utterances/paragraphs
            
        Returns:
            List[List[List[str]]]: For each utterance, a list of sentences, where each sentence is a list of words
        """
        result = []
        
        for utterance in utterances:
            processed_paragraph = self.process_paragraph(utterance)
            result.append(processed_paragraph)
        
        return result
    
    def process_transcript(self, transcript: Dict[str, Any]) -> Dict[str, Any]:
        """
        Process a full transcript with metadata
        
        Args:
            transcript (Dict): Transcript data with 'utterances' key
            
        Returns:
            Dict: Processed transcript with tokenized sentences and words
        """
        result = transcript.copy()
        
        if 'utterances' in transcript:
            processed_utterances = []
            
            for utterance in transcript['utterances']:
                utterance_copy = utterance.copy()
                
                if 'text' in utterance:
                    text = utterance['text']
                    processed_text = self.process_paragraph(text)
                    utterance_copy['processed_text'] = processed_text
                
                processed_utterances.append(utterance_copy)
            
            result['processed_utterances'] = processed_utterances
        
        return result