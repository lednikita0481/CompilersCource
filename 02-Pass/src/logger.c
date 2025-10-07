#include <stdio.h>
#include <stdlib.h>

static long count = 0;
#define MAX_FRAMES 10

void logInstr(char* opcode, char isFlush) {
  static FILE* file = NULL;

  if (!file) file = fopen("trace.log", "w");
  fprintf(file, "%s\n", opcode);

  if (isFlush) 
    count++;

  if (count >= MAX_FRAMES) {
    fflush(file);
    fclose(file);
    exit(0);  
  }
}