CC = gcc
CFLAGS = -Wall -Wextra -std=c99
TARGET = string_add

all: $(TARGET)

$(TARGET): $(TARGET).c
	$(CC) $(CFLAGS) -o $(TARGET) $(TARGET).c

clean:
	rm -f $(TARGET)

run: $(TARGET)
	./$(TARGET)
