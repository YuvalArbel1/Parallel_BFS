# Target executable name
TARGET = part_III.out

# Source files
C_SRCS = main.c
CPP_SRCS = SyncGraph/graph.cpp bfs.cpp ThreadPool.cpp

# Object files
C_OBJS = $(C_SRCS:.c=.o)
CPP_OBJS = $(CPP_SRCS:.cpp=.o)

# Compiler and flags
CC = gcc
CXX = g++
CFLAGS = -c
CXXFLAGS = -c -std=c++11
LDFLAGS = -pthread

# Default target builds the executable
build: $(TARGET)

$(TARGET): $(C_OBJS) $(CPP_OBJS)
	$(CXX) $(LDFLAGS) $(C_OBJS) $(CPP_OBJS) -o $@

# Compiling C sources
%.o: %.c
	$(CC) $(CFLAGS) $< -o $@

# Compiling C++ sources
%.o: %.cpp
	$(CXX) $(CXXFLAGS) $< -o $@

# Run target executes the built program
run: build
	./$(TARGET)

# Debug target builds the executable with debug information
debug: CFLAGS += -g
debug: CXXFLAGS += -g
debug: build

# Clean target removes the executable and object files
clean:
	rm -f $(TARGET) $(C_OBJS) $(CPP_OBJS)
