import os
from dotenv import load_dotenv

# Find the .env file and load its content into the environment
load_dotenv()

# --- Application Configuration ---
# Fetching variables from the environment.
DATADIR = os.getenv("DATADIR")
if not DATADIR:
    raise ValueError("Missing required environment variable: DATADIR")