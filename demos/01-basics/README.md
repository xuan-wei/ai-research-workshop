# Demo 1: Claude Code Basics

## What You'll Learn

Use Claude Code as an intelligent research assistant directly from the terminal.

## Exercises

### Exercise 1.1: Ask a Research Question

```bash
claude "What are the main approaches to retrieval-augmented generation (RAG) for scientific literature? Give me a structured overview."
```

### Exercise 1.2: Analyze a Paper Abstract

Create a file `abstract.txt` with any paper abstract, then:

```bash
claude "Read abstract.txt and: 1) Identify the research gap, 2) Summarize the method, 3) List key contributions, 4) Suggest follow-up research directions"
```

### Exercise 1.3: Generate a BibTeX Entry

```bash
claude "Generate a BibTeX entry for this paper: 'Attention Is All You Need' by Vaswani et al., 2017, NeurIPS"
```

### Exercise 1.4: Interactive Session

Start an interactive session and have a multi-turn research conversation:

```bash
claude
```

Then try:
- "Help me brainstorm research questions about LLM evaluation"
- "Now create a comparison table of recent evaluation benchmarks"
- "Write a one-paragraph related work section based on this"

### Exercise 1.5: Pipe & Compose

```bash
# Use Claude Code in a pipeline
echo "Transformer, BERT, GPT, T5, LLaMA" | claude -p "For each model, give me: year, authors, key innovation, citation count estimate. Format as a markdown table."
```

## Key Takeaways

- `claude` starts interactive mode
- `claude "prompt"` runs a one-shot command
- `claude -p "prompt"` is non-interactive pipe mode (no login required after first auth)
- Claude Code can read/write files, run commands, and maintain context
