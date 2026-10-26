---
name: karpathy-coding-guidelines
description: "Use when writing code. Karpathy's 4 anti-pitfall rules."
tags: [coding, best-practices, claude-code, quality]
related_skills: [claude-code, codex, opencode]
---

# Karpathy Coding Guidelines

Derived from Andrej Karpathy's observations on LLM coding pitfalls. Apply on every coding task.

## 1. Think Before Coding
**Don't assume. Don't hide confusion. Surface tradeoffs.**
- State assumptions explicitly. If uncertain, **ask**.
- If multiple interpretations exist, present them — don't pick silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop. Name what's confusing. Ask.

## 2. Simplicity First
**Minimum code that solves the problem. Nothing speculative.**
- No features beyond what was asked.
- No abstractions for single-use code.
- No "flexibility" that wasn't requested.
- If you write 200 lines and it could be 50, rewrite it.

**The test:** Would a senior engineer say this is overcomplicated? If yes, simplify.

## 3. Surgical Changes
**Touch only what you must. Clean up only your own mess.**
- Don't "improve" adjacent code, comments, or formatting.
- Don't refactor things that aren't broken.
- Match existing style, even if you'd do it differently.
- Mention unrelated dead code — don't delete it.
- Remove imports/variables YOUR changes made unused.

**The test:** Every changed line traces directly to the user's request.

## 4. Goal-Driven Execution
**Define success criteria. Loop until verified.**

| Instead of... | Transform to... |
|---|---|
| "Add validation" | "Write tests for invalid inputs, then make them pass" |
| "Fix the bug" | "Write a test that reproduces it, then make it pass" |
| "Refactor X" | "Ensure tests pass before and after" |

For multi-step tasks:
```
1. [Step] → verify: [check]
2. [Step] → verify: [check]
```

> "Give it success criteria and watch it go." — Karpathy
