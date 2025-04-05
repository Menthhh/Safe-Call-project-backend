import subprocess
import os

class PrologInterface:
    def __init__(self, prolog_file=None):
        """
        Initialize the Prolog interface.
        
        Args:
            prolog_file (str, optional): Path to the default Prolog file
        """
        self.prolog_file = prolog_file
    
    def set_prolog_file(self, file_path):
        """
        Set the Prolog file to use for queries.
        
        Args:
            file_path (str): Path to the Prolog file
        """
        self.prolog_file = file_path
    
    def query(self, query_str, prolog_file=None, debug=False):
        """
        Send a query to Prolog and get the raw output.
        
        Args:
            query_str (str): The Prolog query to execute
            prolog_file (str, optional): Override the default Prolog file
            debug (bool): Print debug information
            
        Returns:
            str: The raw output from Prolog
        """
        file_to_use = prolog_file if prolog_file else self.prolog_file
        if not file_to_use:
            raise ValueError("No Prolog file specified")
        
        # Check if the Prolog file exists
        if not os.path.exists(file_to_use):
            raise FileNotFoundError(f"Prolog file not found: {file_to_use}")
        
        # Prepare the Prolog command
        command = ["swipl", "-s", file_to_use, "-g", query_str, "-t", "halt"]
        
        if debug:
            print(f"DEBUG: Running command: {' '.join(command)}")
            print(f"DEBUG: Current directory: {os.getcwd()}")
            print(f"DEBUG: Prolog file exists: {os.path.exists(file_to_use)}")
        
        # Run the Prolog process
        process = subprocess.run(
            command,
            capture_output=True,
            text=True,
            encoding='utf-8'  
        )
        
        if debug:
            print(f"DEBUG: Return code: {process.returncode}")
            print(f"DEBUG: Stdout: '{process.stdout}'")
            print(f"DEBUG: Stderr: '{process.stderr}'")
        
        # Check for errors
        if process.returncode != 0:
            if process.stderr:
                raise RuntimeError(f"Prolog error: {process.stderr}")
            else:
                raise RuntimeError("Prolog process failed with no error message")
        
        # Return the output
        return process.stdout.strip()