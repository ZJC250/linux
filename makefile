
CC = gcc
CFLAGS = -Wall -Wextra -std=c99
LDFLAGS = -s
TARGET = string_add
.PHONY: all clean run
all: $(TARGET)

$(TARGET): $(TARGET).c
	$(CC) $(CFLAGS) -o $(TARGET) $(TARGET).c

clean:
	rm -f $(TARGET)

run: $(TARGET)
	./$(TARGET)
