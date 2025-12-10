#!/bin/bash

# Helper function for pre commit hooks setup
setup_pre_commit() {
    echo "--- Starting Pre-commit Hooks Setup ---"
    # Install pre-commit if not already installed
    if ! command -v pre-commit &> /dev/null; then
        echo "Pre-commit not found. Installing pre-commit..."
        if uv run pre-commit install --hook-type pre-commit --hook-type pre-push --hook-type commit-msg; then
        echo "Pre-commit hooks installed successfully"
        else
            echo "Failed to install pre-commit hooks (non-critical)"
        fi
    else
        echo "pre-commit is already installed."
    fi
    echo "--- Pre-commit Hooks Setup Complete ---"
}