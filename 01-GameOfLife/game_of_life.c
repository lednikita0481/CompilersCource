#include "sim.h"

#define DEAD 0
#define ALIVE1 1
#define ALIVE2 2

#define SIM_MOUSE_LEFT 1
#define SIM_MOUSE_RIGHT 3
#define SIM_KEY_SPACE 44


void app() {
    int current[FIELD_HEIGHT][FIELD_WIDTH];
    int next[FIELD_HEIGHT][FIELD_WIDTH];
    int y, x;
    int last_flush_time = simGetTicks();

    for (y = 0; y < FIELD_HEIGHT; y++) {
        for (x = 0; x < FIELD_WIDTH; x++) {
            current[y][x] = DEAD;
        }
    }

#if RANDOM_INIT
    for (y = 0; y < FIELD_HEIGHT; y++) {
        for (x = 0; x < FIELD_WIDTH; x++) {
            if (simRand() % 100 < ALIVE_PROB) {
                if (simRand() % 2) {
                    current[y][x] = ALIVE2;
                } else {
                    current[y][x] = ALIVE1;
                }
            }
        }
    }
#endif

#if EDITOR_MODE
    int editing = 1;
    while (editing && !checkFinish()) {
        for (y = 0; y < FIELD_HEIGHT; y++) {
            for (x = 0; x < FIELD_WIDTH; x++) {
                int color;
                if (current[y][x] == ALIVE1) {
                    color = ALIVE_COLOR1;
                } else if (current[y][x] == ALIVE2) {
                    color = ALIVE_COLOR2;
                } else {
                    color = DEAD_COLOR;
                }
                simFillRect(x * CELL_SIZE, y * CELL_SIZE, CELL_SIZE, CELL_SIZE, color);
            }
        }

        simFlush();

        if (simIsKeyDown(SIM_KEY_SPACE)) {
            editing = 0;
        }

        int mx = simGetMouseX() / CELL_SIZE;
        int my = simGetMouseY() / CELL_SIZE;
        if (mx >= 0 && mx < FIELD_WIDTH && my >= 0 && my < FIELD_HEIGHT) {
            if (simIsMouseButtonDown(SIM_MOUSE_LEFT)) {
                current[my][mx] = ALIVE1;
            }
            if (simIsMouseButtonDown(SIM_MOUSE_RIGHT)) {
                current[my][mx] = ALIVE2;
            }
        }
    }
#endif

    while (!checkFinish()) {
        for (y = 0; y < FIELD_HEIGHT; y++) {
            for (x = 0; x < FIELD_WIDTH; x++) {
                int color;
                if (current[y][x] == ALIVE1) {
                    color = ALIVE_COLOR1;
                } else if (current[y][x] == ALIVE2) {
                    color = ALIVE_COLOR2;
                } else {
                    color = DEAD_COLOR;
                }
                simFillRect(x * CELL_SIZE, y * CELL_SIZE, CELL_SIZE, CELL_SIZE, color);
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
                int count1 = 0;
                int count2 = 0;
                int dy, dx;
                for (dy = -1; dy <= 1; dy++) {
                    for (dx = -1; dx <= 1; dx++) {
                        if (dy == 0 && dx == 0) continue;
                        int ny = (y + dy + FIELD_HEIGHT) % FIELD_HEIGHT;
                        int nx = (x + dx + FIELD_WIDTH) % FIELD_WIDTH;
                        if (current[ny][nx] == ALIVE1) {
                            neighbors++;
                            count1++;
                        } else if (current[ny][nx] == ALIVE2) {
                            neighbors++;
                            count2++;
                        }
                    }
                }
                if (current[y][x] > DEAD) {
                    if (neighbors == 2 || neighbors == 3) {
                        next[y][x] = current[y][x];
                    } else {
                        next[y][x] = DEAD;
                    }
                } else {
                    if (neighbors == 3) {
                        if (count1 > count2) {
                            next[y][x] = ALIVE1;
                        } else {
                            next[y][x] = ALIVE2;
                        }
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