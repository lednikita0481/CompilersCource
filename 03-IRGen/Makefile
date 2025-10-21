CXX = clang++
LLVM_FLAGS = `llvm-config --cppflags --ldflags --system-libs --libs core mcjit native`
SDL_FLAGS = -lSDL2

all: app_gen_interpret

app_gen_interpret: generator.cpp interpreter.cpp main.cpp sim.c
	$(CXX) $(LLVM_FLAGS) $(SDL_FLAGS) $^ -o $@

clean:
	rm -f app_gen_interpret

run: app_gen_interpret
	./app_gen_interpret out.ll