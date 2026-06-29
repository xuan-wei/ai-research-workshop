# Demo 4: Harness Engineering - Multi-Agent Research Workflows

## What You'll Learn

Orchestrate multiple AI agents working in parallel to tackle complex research tasks — 
the most powerful level of AI-assisted research.

## Concept: What is a Harness?

```
                    ┌─── Agent A: Search papers on Method X
                    │
You → Orchestrator ─┼─── Agent B: Search papers on Method Y ──→ Synthesizer → Final Report
                    │
                    └─── Agent C: Search papers on Method Z
```

A "harness" is a program that coordinates multiple AI agents:
- **Fan-out**: Split a complex task into parallel sub-tasks
- **Specialize**: Each agent focuses on one aspect
- **Synthesize**: Merge results into a coherent output
- **Verify**: Cross-check findings adversarially

## Exercises

### Exercise 4.1: Parallel Literature Search

In Claude Code interactive mode, try this prompt:

```
I need a comprehensive literature review on "LLM Alignment". 
Use multiple sub-agents to search in parallel:
- Agent 1: RLHF-based approaches
- Agent 2: Constitutional AI and rule-based approaches  
- Agent 3: Direct Preference Optimization (DPO) and variants
- Agent 4: Evaluation methods and benchmarks for alignment

For each thread, find 5 key papers. Then synthesize into a unified review.
```

### Exercise 4.2: Adversarial Verification

```
Research claim: "Scaling model parameters always improves performance on reasoning tasks."

Use a multi-agent approach:
1. Agent 1 (Advocate): Find evidence SUPPORTING this claim
2. Agent 2 (Skeptic): Find evidence REFUTING this claim
3. Agent 3 (Judge): Evaluate both sides and give a nuanced verdict

Return a structured debate summary.
```

### Exercise 4.3: Run the Example Workflow Script

Look at the workflow script in this directory:

```bash
cat workflow-review.js
```

This is a Claude Code workflow script that:
1. Fans out multiple reviewer agents in parallel
2. Each reviews from a different dimension
3. Synthesizes findings into a final report

### Exercise 4.4: Design Your Own Harness

Think about a research task that would benefit from:
- Multiple parallel searches
- Different "expert" perspectives
- Cross-validation of findings

Design the harness on paper first:
1. What agents do you need?
2. What does each agent do?
3. How do you combine their outputs?
4. How do you verify quality?

Then implement it as a workflow or a multi-agent prompt.

## Key Concepts

| Concept | Description | When to Use |
|---------|-------------|-------------|
| **Fan-out** | Split one task into N parallel sub-tasks | Large search spaces, multiple perspectives needed |
| **Pipeline** | Chain agents sequentially (output of A → input of B) | Multi-step transformations |
| **Adversarial** | Agents argue opposing positions | Claim verification, bias detection |
| **Judge Panel** | Multiple independent agents + synthesis | High-stakes decisions, reducing hallucination |
| **Loop-until-dry** | Keep searching until no new results | Exhaustive literature review |

## Key Takeaways

- Harness engineering = designing the coordination pattern, not just the prompt
- Parallel agents dramatically reduce wall-clock time
- Adversarial patterns improve reliability
- The orchestration logic is deterministic (code); the intelligence is in each agent
