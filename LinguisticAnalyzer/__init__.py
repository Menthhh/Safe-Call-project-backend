# PrologInterface/__init__.py
from .linguistic_analyzer import LinguisticAnalyzer
#prevent Example "from PrologInterface import *" which will import all classes and functions
__all__ = ['LinguisticAnalyzer']