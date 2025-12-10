#!/bin/bash

# Source helper fns
SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly SOURCE_DIR
source "${SOURCE_DIR}/helpers/dvc_setup.sh"
source "${SOURCE_DIR}/helpers/pre_commit_setup.sh"

# Suggest next steps
show_next_steps() {
    echo "When committing changes to git:"
    echo ""
    echo "  1. Pre-commit checks:"
    echo "     ./precommit.sh"
    echo ""
    echo "  2. Linting and formatting:"
    echo "     ./ruff.sh"
    echo ""
    echo "For manual operations:"
    echo "  - Rebuild Dev container: F1 in VSCode --> Dev Containers: Rebuild Container"
    echo "  - Run any command with uv: uv run <command>"
    echo "  - Run specific pre-commit hook: uv run pre-commit run <hook-id>"
    echo "  - Update pre-commit hooks: uv run pre-commit autoupdate"
    echo ""
    echo "When committing DVC-tracked data:"
    echo ""
    echo "  - Add data: dvc add <file>"
    echo "  - Push data to remote: dvc push"
    echo ""
}

main() {
    print_header "Setup Script Starting"

    setup_dvc
    setup_pre_commit
    show_next_steps
}

main