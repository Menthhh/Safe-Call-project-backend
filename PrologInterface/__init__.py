# PrologInterface/__init__.py
from .prolog_interface import PrologInterface
#prevent Example "from PrologInterface import *" which will import all classes and functions
__all__ = ['PrologInterface']