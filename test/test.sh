#!/bin/bash
set -e

# Check if valgrind is installed
if ! command -v valgrind &> /dev/null; then
    echo "valgrind is not installed. Please install it first."
    exit 1
fi

# Check if binary exists
if [[ ! -f ./bin/main ]]; then
    echo "Binary ./bin/main not found. Build first with 'make'."
    exit 1
fi

# Run valgrind for memeory leak
echo "Running valgrind on ./bin/main..."
valgrind --leak-check=full --show-leak-kinds=all ./bin/main
