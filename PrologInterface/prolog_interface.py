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
        
        try:
            # Run the Prolog process with universal_newlines=False to get bytes output
            process = subprocess.run(
                command,
                capture_output=True,
                text=False  # Changed to False to get bytes instead of text
            )
            
            # Try to decode with 'utf-8' first, then fall back to other encodings
            try:
                stdout = process.stdout.decode('utf-8') if process.stdout else ""
                stderr = process.stderr.decode('utf-8') if process.stderr else ""
            except UnicodeDecodeError:
                # Try with common Thai encodings
                for encoding in ['tis-620', 'cp874']:
                    try:
                        stdout = process.stdout.decode(encoding) if process.stdout else ""
                        stderr = process.stderr.decode(encoding) if process.stderr else ""
                        break
                    except UnicodeDecodeError:
                        continue
                else:
                    # Last resort: replace invalid characters
                    stdout = process.stdout.decode('utf-8', errors='replace') if process.stdout else ""
                    stderr = process.stderr.decode('utf-8', errors='replace') if process.stderr else ""
            
            if debug:
                print(f"DEBUG: Return code: {process.returncode}")
                print(f"DEBUG: Stdout: '{stdout}'")
                print(f"DEBUG: Stderr: '{stderr}'")
            
            # Check for errors
            if process.returncode != 0:
                if stderr:
                    raise RuntimeError(f"Prolog error: {stderr}")
                else:
                    raise RuntimeError("Prolog process failed with no error message")
                
            if '\\u0E' in stdout:
                try:
                    stdout = stdout.encode('utf-8').decode('unicode_escape')
                    if debug:
                        print(f"DEBUG: Decoded escaped unicode to: {stdout}")
                except Exception as decode_err:
                    if debug:
                        print(f"DEBUG: Failed to decode unicode escapes: {decode_err}")
            
            # Return the output
            return stdout.strip()
            
        except Exception as e:
            if debug:
                print(f"DEBUG: Exception occurred: {str(e)}")
            raise