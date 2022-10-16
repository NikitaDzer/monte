CC     = gcc
CFLAGS = -O3
LFLAGS = -pthread -lm

BUILD_DIR = ./build
EXEC_FILE = monte


all: $(EXEC_FILE)

$(EXEC_FILE): $(BUILD_DIR)/main.o $(BUILD_DIR)/monte.o
	$(CC) $(LFLAGS) $(BUILD_DIR)/main.o $(BUILD_DIR)/monte.o -o $(EXEC_FILE)

$(BUILD_DIR)/main.o: $(BUILD_DIR) main.c
	$(CC) -c $(CFLAGS) main.c -o $(BUILD_DIR)/main.o

$(BUILD_DIR)/monte.o: monte.c monte.h
	$(CC) -c $(CFLAGS) monte.c -o $(BUILD_DIR)/monte.o

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR) $(EXEC_FILE)
