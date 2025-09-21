# Simple Game of life implementation

## Usage:
Simple run:
```
sudo apt install libsdl2-dev
clang sim.c game_of_life.c start.c -lSDL2 -O2 -o game_of_life
./game_of_life
```

Generating LLVM IR:
```
clang game_of_life.c -emit-llvm -S -O2 -o IR/game_of_life.ll
```
