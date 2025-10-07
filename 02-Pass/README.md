# Instrumenting LLVM pass

During collecting traces 01-GameOfLife/sim.h parameters were set to *FIELD_WIDTH* = *FIELD_HEIGHT* = 64, *EDITOR_MODE* = 0

Pass collects traces after optimisations until drawing 10 frames (can be changed in logger.c)

## How to use

```
./run.sh
```

Comparison results are in *comparison* folder

Examples:

![one](/02-Pass/comparison/hist_instr_counts.png)

![two](/02-Pass/comparison/hist_O1_w1.png)

![three](/02-Pass/comparison/hist_O2_w1.png)

![four](/02-Pass/comparison/hist_O2_w1.png)
