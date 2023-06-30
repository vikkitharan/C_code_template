# Compiler and flags
CC       := gcc
CFLAGS   := -std=c17 -g -Wall -Wextra -pedantic -MMD -MP
INC      := -I include
LIBS     := -lm
RM       := rm -rf

# Project structure
SRCDIR   := src
BUILDDIR := build
BINDIR   := bin
TARGET   := $(BINDIR)/main

SRCEXT   := c
SOURCES  := $(shell find $(SRCDIR) -type f -name '*.$(SRCEXT)')
OBJECTS  := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES:.$(SRCEXT)=.o))
DEPS     := $(OBJECTS:.o=.d)

# Default rule
all: $(TARGET)

# Link step
$(TARGET): $(OBJECTS)
	@mkdir -p $(BINDIR)
	$(CC) $(OBJECTS) -o $@ $(LIBS)

# Compile step
$(BUILDDIR)/%.o: $(SRCDIR)/%.$(SRCEXT)
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $(INC) -c -o $@ $<

# Include dependencies
-include $(DEPS)

# Clean build artifacts
clean:
	$(RM) $(BUILDDIR) $(BINDIR)

# Run the program
run: $(TARGET)
	@echo "Running $(TARGET)..."
	./$(TARGET)

# Run tests
test: $(TARGET)
	@chmod +x test/test.sh 2>/dev/null || true
	@./test/test.sh || echo "No test script found."

.PHONY: all clean run test
