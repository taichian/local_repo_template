#!/bin/bash

# Helper function for dvc setup
setup_dvc() {
    # Define DVC constants
    DVC_REMOTE_NAME="local_data_store"
    DVC_REMOTE_URL="/opt/dvc-cache"

    echo "--- Starting DVC Setup ---"

    # 1. Conditional Initialization: Only run dvc init if .dvc doesn't exist
    if [ ! -d ".dvc" ]; then
        echo "DVC repository not found. Running dvc init..."
        dvc init
    else
        echo "DVC already initialized."
    fi

    # 2. Add Remote: Add the local remote. 
    # The '|| true' ensures the script doesn't fail if the remote already exists.
    echo "Setting up DVC remote: ${DVC_REMOTE_NAME} at ${DVC_REMOTE_URL}"
    dvc remote add -d -f "${DVC_REMOTE_NAME}" "${DVC_REMOTE_URL}" || true

    # 3. Pull Data: Pull data from the remote (if needed - new branch etc)
    # echo "Pulling DVC data from remote..."
    # dvc pull --force

    echo "--- DVC Setup Complete ---"
    echo "To use DVC, you can run commands like 'dvc add <file>', 'dvc push', and 'dvc pull'."
}