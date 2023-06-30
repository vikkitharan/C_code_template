#!/bin/bash
#-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
#         File: scripts/install_git_hooks.sh
#               Install git hooks
#   Created by: vikki
#   Created on: 2021/08/08
#  Modified by: vikki
#  Modified on: 2021/08/08
#      Version: 0.0.0
#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
set -e

# Prompt for LLVM style
read -rp "Do you want to use the default LLVM style? (y/n) [y]: " is_llvm_format
is_llvm_format=${is_llvm_format:-y}

generate_clang_format() {
    clang-format -style=llvm -dump-config > ./.clang-format
    echo ".clang-format file created."
}

if [[ "$is_llvm_format" == "y" ]]; then
    generate_clang_format
else
    echo "Please update the -style option in this script or manually edit .clang-format."
    read -rp "Have you done this? (y/n): " is_format_update
    if [[ "$is_format_update" == "y" ]]; then
        generate_clang_format
    else
        echo "Aborting. Update the style and rerun."
        exit 1
    fi
fi

# Ensure git repo
if ! GIT_DIR=$(git rev-parse --git-dir 2>/dev/null); then
    echo "Error: Not a git repository."
    exit 1
fi

mkdir -p $GIT_DIR/hooks

# Install hooks
HOOKS=("clang-format-diff.py" "format_clang_c_cpp.sh" "pre-commit" "post-checkout" "post-commit" "post-merge" "post-rewrite")
for hook in "${HOOKS[@]}"; do
    src="./scripts/.git_hooks/$hook"
    dest="$GIT_DIR/hooks/$hook"
    if [[ -f "$src" ]]; then
        cp "$src" "$dest"
        chmod +x "$dest"
    else
        echo "Warning: $src not found, skipping."
    fi
done

echo "Git hooks installed successfully!"
