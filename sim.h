#define FIELD_WIDTH 512
#define FIELD_HEIGHT 256
#define CELL_SIZE 3
#define SIM_Y_SIZE (FIELD_HEIGHT * CELL_SIZE)
#define SIM_X_SIZE (FIELD_WIDTH * CELL_SIZE)

#ifndef __sim__
#define __sim__
void simInit();
void app();
void simExit();
void simFlush();
void simPutPixel(int x, int y, int rgb);
void simFillRect(int x, int y, int w, int h, int rgb);
int simRand();
int simGetTicks();
void simDelay(int ms);
int checkFinish();
#endif