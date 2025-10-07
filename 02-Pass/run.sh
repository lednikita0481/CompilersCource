#!/bin/bash

make clean
make

for opt in O1 O2 O3 Os; do
    echo "Running game with -$opt..."
    ./bin/game_$opt > /dev/null 2>&1 &
    PID=$!
    wait $PID 2>/dev/null || true 
    mv trace.log trace_$opt.log
done

echo "Analyzing results..."
python3 analyze.py

rm -rf ./bin ./obj trace_*.log

echo "Done! comparison dir for results."