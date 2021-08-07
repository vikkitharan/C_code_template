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

# Create the clang-format configuration file.

echo "Do you want to use the default format style (LLVM)\n \
  enter (y/n)  y for yes any other keys for no." 

read is_llvm_format

if [[ is_llvm_format == 'y' ]]; then
  clang-format -style=llvm -dump-config > ./.clang-format
else;
  echo "Below styles can be configured by changing -style option. Please change -style option and rerun for different formats.
  -style=google for google, \n \
  -style=chromium for Chromium, \n \
  -style=mozilla for Mozilla  or \n \
  -style=webkit for WebKit. \n \
  Other formats are possible.  For further details are available in clang-format [webpage](https://clang.llvm.org/docs/ClangFormat.html)"
  
  echo "Have you changed the -style or will you change ./.clang-format file manually? \n \
  enter (y/n)  y for yes any other keys for no."

  read is_format_update

  if [[ is_format_update == 'y' ]]; then
    clang-format -style=llvm -dump-config > ./.clang-format
  else
    echo "Please update -style option or update ./clang-format."
    exit 1
  fi
fi

## Install the hooks by bellow command
GIT_DIR=$(git rev-parse --git-dir)

echo "Installing hooks..."

cp ./scripts/.git_hooks/clang-format-diff.py $GIT_DIR/hooks/
cp ./scripts/.git_hooks/format_clang_c_cpp.sh $GIT_DIR/hooks/
cp ./scripts/.git_hooks/update_ctags.sh $GIT_DIR/hooks/
cp ./scripts/.git_hooks/pre-commit $GIT_DIR/hooks/pre-commit
cp ./scripts/.git_hooks/post-checkout $GIT_DIR/hooks/post-checkout
cp ./scripts/.git_hooks/post-commit $GIT_DIR/hooks/post-commit
cp ./scripts/.git_hooks/post-merge $GIT_DIR/hooks/post-merge
cp ./scripts/.git_hooks/post-rewrite $GIT_DIR/hooks/post-rewrite
echo "Done!"
