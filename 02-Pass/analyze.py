from collections import Counter
import os
import matplotlib.pyplot as plt

opt_levels = ['O1', 'O2', 'O3', 'Os']
window_sizes = range(1, 6)
comparison_dir = 'comparison'

if not os.path.exists(comparison_dir):
    os.makedirs(comparison_dir)

instr_counts = {}
for opt in opt_levels:
    trace_file = f'trace_{opt}.log'
    if not os.path.exists(trace_file):
        continue
    with open(trace_file, 'r') as f:
        lines = [line.strip() for line in f.readlines() if line.strip()]  # Extract opcodes
    instr_counts[opt] = len(lines)
    results = {}
    for window in window_sizes:
        patterns = Counter('\n'.join(lines[i:i+window]) for i in range(len(lines) - window + 1))
        top_patterns = patterns.most_common(10)
        results[window] = top_patterns
        
        if top_patterns:
            labels, counts = zip(*top_patterns)
            plt.figure(figsize=(12, 6))
            plt.bar(labels, counts)
            plt.title(f'Most Frequent Patterns (Window {window}) - {opt}')
            plt.xlabel('Patterns')
            plt.ylabel('Frequency')
            plt.tight_layout()
            plt.savefig(os.path.join(comparison_dir, f'hist_{opt}_w{window}.png'))
            plt.close()


if instr_counts:
    plt.figure(figsize=(8, 6))
    plt.bar(instr_counts.keys(), instr_counts.values())
    plt.title('Total Executed Instructions by Optimization Level')
    plt.xlabel('Optimization Level')
    plt.ylabel('Instruction Count')
    plt.tight_layout()
    plt.savefig(os.path.join(comparison_dir, 'hist_instr_counts.png'))
    plt.close()