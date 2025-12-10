#!/bin/bash

# Run pre-commit hooks on all files
run_precommit_hooks() {
    echo "Running pre-commit on all files..."
    echo ""

    uv run pre-commit run --all-files
    return $?
}

# Display pre-commit results summary
show_precommit_summary() {
    local exit_code=$1

    print_header "Pre-commit Summary"

    if [ "$exit_code" -eq 0 ]; then
        echo "All pre-commit hooks passed."
    else
        echo "Some pre-commit hooks failed or made changes"
        echo "To see all hooks:"
        echo "  uv run pre-commit run --all-files --verbose"
    fi

    echo ""
}

# Main execution
main() {
    print_header "Running Pre-commit Hooks"

    check_environment
    ensure_dev_dependencies
    echo ""

    run_precommit_hooks
    local exit_code=$?

    show_precommit_summary $exit_code

    exit $exit_code
}

main