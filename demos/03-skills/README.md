# Demo 3: Custom Skills - Reusable Research Workflows

## What You'll Learn

Create custom slash commands (skills) that package complex research workflows into one-click actions.

## Pre-built Skills

This demo comes with ready-to-use skills:

| Skill | Command | What it does |
|-------|---------|-------------|
| Literature Review | `/lit-review` | Systematic search + summary table |
| Paper Critique | `/paper-critique` | Structured review of a paper |
| Research Gap Finder | `/research-gap` | Identify gaps from a set of papers |

## Exercises

### Exercise 3.1: Use a Pre-built Skill

Start Claude Code and try the built-in skills:

```bash
cd demos/03-skills
claude
```

Then type:
```
/lit-review transformer efficiency optimization
```

### Exercise 3.2: Read the Skill Source

Look at how skills are defined:

```bash
cat .claude/commands/lit-review.md
```

A skill is just a markdown file in `.claude/commands/` with:
- A description line (becomes the help text)
- A prompt template with `$ARGUMENTS` placeholder

### Exercise 3.3: Create Your Own Skill

Create a new skill for generating research proposals:

```bash
mkdir -p .claude/commands
```

Then create a file `.claude/commands/proposal.md` with your own prompt template.
Use `$ARGUMENTS` where the user's input should go.

### Exercise 3.4: Skill with Multi-Step Workflow

Create a skill that chains multiple steps:

```
/project:create-skill experiment-plan
```

Design a skill that:
1. Takes a research hypothesis as input
2. Designs an experiment to test it
3. Lists required datasets
4. Suggests evaluation metrics
5. Identifies potential confounds

## Key Takeaways

- Skills = markdown files in `.claude/commands/`
- `$ARGUMENTS` captures user input after the slash command
- Skills can be shared via git (check them into the repo)
- Chain complex multi-step workflows into a single command
