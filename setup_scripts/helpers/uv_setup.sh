#!/bin/bash

# Helper function for to check uv is set up/install dependencies for local project


# Check if pyproject.toml exists
install_uv_if_missing() {
    if ! command -v uv &> /dev/null; then
        echo ""
        echo "Install uv"
        curl -LsSf https://astral.sh/uv/install.sh | sh

        if [ $? -eq 0 ]; then
            echo "uv installed successfully"
            # Add uv to PATH for current session
            export PATH="$HOME/.local/bin:$PATH"
        else
            echo "uv installation failed."
            echo "Install manually: https://github.com/astral-sh/uv"
            exit 1
        fi
    fi
}

verify_uv_installed() {
    # If pyproject.toml not found, then install uv_if_missing
    if [ ! -f "pyproject.toml" ]; then
        echo "pyproject.toml not found in the current directory."
        install_uv_if_missing
        return
    fi
    }

# Install project dependencies
install_dependencies() {
    if [ -f "uv.lock" ]; then
        echo "Using locked dependencies (uv.lock)..."
        uv sync --frozen --all-extras || {
            echo "Install dependencies failed"
            exit 1
        }
    else
        echo "No lock file found, syncing dependencies..."
        uv sync --all-extras || {
            echo "Failed to install dependencies"
            exit 1
        }
    fi

    echo "Dependencies installed successfully."
}

setup_uv() {
    echo "--- Starting uv Setup ---"
    verify_uv_installed
    install_dependencies
    echo "--- uv Setup Complete ---"
}