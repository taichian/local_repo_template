#!/bin/bash

# Run ruff check and fix
run_ruff_check() {
    echo "Running ruff check and fix..."
    echo ""

    run_command uv run ruff check --fix .
    return $?
}

# Run ruff format
run_ruff_format() {
    echo ""
    echo "Running ruff format..."
    echo ""

    run_command uv run ruff format .
    return $?
}

# Main execution
main() {
    print_header "Running ruff Check and Format"

    run_ruff_check
    local check_exit_code=$?

    run_ruff_format
    local format_exit_code=$?
    exit $?
}

main