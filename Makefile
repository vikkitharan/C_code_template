# Compiler and flags
CXX      := g++
CXXFLAGS := -std=c++20 -g -Wall -Wextra -pedantic -MMD -MP
INC      := -I include
RM       := rm -rf

# Project structure
SRCDIR   := src
BUILDDIR := build
BINDIR   := bin
TARGET   := $(BINDIR)/main

SRCEXT   := cpp
SOURCES  := $(shell find $(SRCDIR) -type f -name '*.$(SRCEXT)')
OBJECTS  := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES:.$(SRCEXT)=.o))
DEPS     := $(OBJECTS:.o=.d)

# Default rule
all: $(TARGET)

# Link step
$(TARGET): $(OBJECTS)
	@mkdir -p $(BINDIR)
	$(CXX) $(OBJECTS) -o $@

# Compile step
$(BUILDDIR)/%.o: $(SRCDIR)/%.$(SRCEXT)
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) $(INC) -c -o $@ $<

# Include dependencies
-include $(DEPS)

# Clean build artifacts
clean:
	$(RM) $(BUILDDIR) $(BINDIR)

# Run the program
run: $(TARGET)
	@echo "Running $(TARGET)..."
	@./$(TARGET)

# Run tests
test: $(TARGET)
	@test -x test/test.sh || chmod +x test/test.sh
	@./test/test.sh || echo "No test script found."

.PHONY: all clean run test
