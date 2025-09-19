#include "sim.h"

#define MS_PER_GENERATION 10
#define ALIVE_PROB 50
#define ALIVE_COLOR 0xFFFFFF
#define DEAD_COLOR 0x000000


#define ALIVE 1
#define DEAD 0

void app() {
    int current[FIELD_HEIGHT][FIELD_WIDTH];
    int next[FIELD_HEIGHT][FIELD_WIDTH];
    int y, x, cy, cx;
    int last_flush_time = simGetTicks();

    for (y = 0; y < FIELD_HEIGHT; y++) {
        for (x = 0; x < FIELD_WIDTH; x++) {
            if (simRand() % 100 < ALIVE_PROB) {
                current[y][x] = ALIVE;
            } else {
                current[y][x] = DEAD;
            }
        }
    }

    while (!checkFinish()) {
        for (y = 0; y < FIELD_HEIGHT; y++) {
            for (x = 0; x < FIELD_WIDTH; x++) {
                int color = (current[y][x] == ALIVE) ? ALIVE_COLOR : DEAD_COLOR;
                for (cy = 0; cy < CELL_SIZE; cy++) {
                    for (cx = 0; cx < CELL_SIZE; cx++) {
                        simPutPixel(x * CELL_SIZE + cx, y * CELL_SIZE + cy, color);
                    }
                }
            }
        }

        int current_time = simGetTicks();
        int elapsed = current_time - last_flush_time;
        if (elapsed < MS_PER_GENERATION) {
            simDelay(MS_PER_GENERATION - elapsed);
        }
        simFlush();
        last_flush_time = simGetTicks();

        for (y = 0; y < FIELD_HEIGHT; y++) {
            for (x = 0; x < FIELD_WIDTH; x++) {
                int neighbors = 0;
                int dy, dx;
                for (dy = -1; dy <= 1; dy++) {
                    for (dx = -1; dx <= 1; dx++) {
                        if (dy == 0 && dx == 0) continue;
                        int ny = (y + dy + FIELD_HEIGHT) % FIELD_HEIGHT;
                        int nx = (x + dx + FIELD_WIDTH) % FIELD_WIDTH;
                        if (current[ny][nx] == ALIVE) neighbors++;
                    }
                }
                if (current[y][x] == ALIVE) {
                    if (neighbors == 2 || neighbors == 3) {
                        next[y][x] = ALIVE;
                    } else {
                        next[y][x] = DEAD;
                    }
                } else {
                    if (neighbors == 3) {
                        next[y][x] = ALIVE;
                    } else {
                        next[y][x] = DEAD;
                    }
                }
            }
        }

        for (y = 0; y < FIELD_HEIGHT; y++) {
            for (x = 0; x < FIELD_WIDTH; x++) {
                current[y][x] = next[y][x];
            }
        }
    }
}