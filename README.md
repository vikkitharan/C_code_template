# C Project Template #

This is a C source code template with:

- Modular project structure (src/, include/, build/, bin/)
- Makefile for building, cleaning, running, and testing
- Git hooks setup for code formatting and automation
- Example test.sh for memory checking with valgrind

This is a C source code template

## How to Use This Template

1. Clone the repository
    - to clone `git clone git@github.com:vikkitharan/C_code_template.git`
```bash
git clone git@github.com:vikkitharan/C_code_template.git
cd C_code_template
```

2. Rename the project directory to your project name.

3. Switch to the desired branch
    - C branch for C projects
    - C++ branch for C++ projects

4. Remove the original git history (if starting a fresh project)
```bash
rm -rf .git
```

5. Replace README.md with your own project documentation.

6. Initialize git with custom hooks (optional)
```bash
git init --template=./scripts/.git_hooks/
```

7. Add your project files
```bash
git add *
git add .gitignore .version
git commit -m "Initial commit"
```

## Build and Run
```bash
make
```

## Run the program:
```bash
make run
```

## Testing
```bash
make test
```

The test.sh script checks for memory leaks using valgrind.

# Git Hooks and Automation
This template includes scripts for:

 - Clang-format hooks (.git/hooks/) to maintain code style
 - Ctags update scripts for easy navigation
 - Automatic hook installation:

```bash
scripts/install_hooks.sh
```
