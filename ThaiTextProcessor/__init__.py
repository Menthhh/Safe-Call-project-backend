# PrologInterface/__init__.py
from .thai_text_processor import ThaiTextProcessor
#prevent Example "from PrologInterface import *" which will import all classes and functions
__all__ = ['ThaiTextProcessor']