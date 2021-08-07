CC := gcc

SRCDIR := src
BUILDDIR := build
TARGET := bin/main

SRCEXT := c
SOURCES := $(shell find $(SRCDIR) -type f -name *.$(SRCEXT))
OBJECTS := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES:.$(SRCEXT)=.o))

CFLAGS := -g  -Wall

LIB :=
INC := -I include

$(TARGET): $(OBJECTS)
	mkdir -p bin
	$(CC) $^ -o $(TARGET) $(LIB) -lm

$(BUILDDIR)/%.o: $(SRCDIR)/%.$(SRCEXT)
	mkdir -p $(BUILDDIR)
	$(CC) $(CFLAGS) $(INC) -c -o $@ $<

clean:
	$(RM) -r $(BUILDDIR)/*.o $(BUILDDIR)/*/*.o $(TARGET)

.PHONY: clean
