# 42find · Intent

> Intent is action. This file decides what this system becomes.
> **Only one thing requires your eyes: the convergence direction. Everything else is a draft.**
> **It will be rough right now. You'll refine it after `-research` — the four steps are a loop, not a line.**

## Convergence Direction (the one thing)

Return the right file or note in one query — **precision over recall**.

How to measure: For any query, does the target result appear in the top 3? If not, that's a miss. Speed benchmark: results in under 2 seconds on a corpus of 10,000 files.

## True Hard Problems

1. **The tip-of-tongue problem** — you remember a fragment (a phrase, a rough date, a related topic) but not the filename or folder. Full-text fuzzy search across thousands of files, returning results fast, is the only solution. No single tool nails this for mixed personal file collections.

2. **Cross-format unification** — notes live in `.md`, `.txt`, PDFs, maybe Word docs. Getting one query to search all formats without forcing the user to pick a tool per format is unsolved for personal use.

## What Not To Do

| Don't do | Why |
|---|---|
| Web / internet search | 42find is personal-file-only; adding web turns it into a different product |
| AI summarization or synthesis | Find, don't generate — synthesis is a separate concern |
| File organization or moving files | Search within the existing structure; never touch what it finds |
| GUI-first | CLI first, GUI is optional later — keep the core scriptable |

## Sources of Truth

When conflicting, trust in this order (fill in after `-research`):

1. The actual file system state — what exists on disk is ground truth
2. User-maintained index / metadata (tags, front matter)
3. Inferred metadata (modification date, directory name)

## Work Area

- Directory: `src/`
- What it produces: a CLI tool (`42find <query>`) that returns ranked file paths with a snippet
- **What counts as done (validation loop)**: given a partial keyword, the target file appears in top 3 results, returned in under 2 seconds, on a 10,000-file test corpus

---

*Drafted by `aias-meta-init` on 2026-09-16. Edit this file directly — no commands needed.*
