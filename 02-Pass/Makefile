LLVM_CONFIG = llvm-config
CXXFLAGS = -fPIC -shared -I$(shell $(LLVM_CONFIG) --includedir)
LDFLAGS = -lSDL2
OBJ_DIR = obj
BIN_DIR = bin
CC = clang
CXX = clang++

all: $(OBJ_DIR) $(BIN_DIR) libTracePass.so logger.o games

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

libTracePass.so: src/TracePass.cpp
	$(CXX) $(CXXFLAGS) -o $(OBJ_DIR)/libTracePass.so src/TracePass.cpp

logger.o: src/logger.c
	$(CC) -c src/logger.c -o $(OBJ_DIR)/logger.o

games: $(OBJ_DIR)/logger.o
	$(CC) -fpass-plugin=$(OBJ_DIR)/libTracePass.so -o $(BIN_DIR)/game_O1 ../01-GameOfLife/start.c ../01-GameOfLife/sim.c ../01-GameOfLife/game_of_life.c $(OBJ_DIR)/logger.o $(LDFLAGS) -O1
	$(CC) -fpass-plugin=$(OBJ_DIR)/libTracePass.so -o $(BIN_DIR)/game_O2 ../01-GameOfLife/start.c ../01-GameOfLife/sim.c ../01-GameOfLife/game_of_life.c $(OBJ_DIR)/logger.o $(LDFLAGS) -O2
	$(CC) -fpass-plugin=$(OBJ_DIR)/libTracePass.so -o $(BIN_DIR)/game_O3 ../01-GameOfLife/start.c ../01-GameOfLife/sim.c ../01-GameOfLife/game_of_life.c $(OBJ_DIR)/logger.o $(LDFLAGS) -O3
	$(CC) -fpass-plugin=$(OBJ_DIR)/libTracePass.so -o $(BIN_DIR)/game_Os ../01-GameOfLife/start.c ../01-GameOfLife/sim.c ../01-GameOfLife/game_of_life.c $(OBJ_DIR)/logger.o $(LDFLAGS) -Os

clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR) trace_*.log comparison