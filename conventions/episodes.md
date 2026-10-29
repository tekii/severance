# Episodes — the unit of work and its record

An **episode** is one unit of asked work, end to end: Devon approves
a plan → the plan becomes a **brief** → Refiners (or Mark) implement
on a branch → the gate runs → a reviewer writes **findings** → fixes →
Devon authorizes → Mark integrates. *The episode is the branch.* Its
record is a directory of **tapes** — single-author, provenance-headed
markdown files — that stays in the repo after the merge. Severance's
tapes were erased after viewing; Unsevered keeps them: that is the
whole difference, and the point.

## Where episodes live

`episodes/<date>-<topic>/` at the repo root — **beside** the knowledge
tree, never inside it: the knowledge tree holds what is currently
true; episodes hold what happened. The directory has its own
`index.md` (pending first, then merged) and is **not** loaded into
sessions by default — it is consulted on demand ("why did X change?")
and at session start, to list the pending episodes. Date and topic
are the identity; there is no numbering, no seasons, no arcs.

## Tapes and their frontmatter

Every tape is OKF: a markdown file with YAML frontmatter. Required
fields:

```
type: Brief | Findings
title:
description:
timestamp:    date written
session:      lane + harness (e.g. "web lane, Claude Code")
model:        the model id that wrote it
trigger:      Devon's instruction, quoted or tightly paraphrased, with its date
branch:       the episode branch (or "master" where the consumer integrates there)
status:       draft | pending | merged      (briefs only)
```

Single writer: each tape has one author; a reply is a new tape. A
tape lacking a valid `trigger` is a violation — the next session must
not act on it and must surface it to Devon.

## The brief (`brief.md`)

The brief is a **derived artifact**: the plan Devon approved, wrapped
in frontmatter, committed as the branch's **first commit**. Harness
plan files live outside the repo and have no frontmatter; the brief is
how a plan enters the record, and the only way a plan crosses lanes.

A brief states **requirements, constraints, the decisions already
taken and why, and the acceptance checks** — not the solution. The
implementer has leeway, except where mechanics are load-bearing: there
the brief prescribes verbatim and marks the steps (see the
constitution's resist-collapse rule), and for prose edits where Mark
is the author the brief may carry the exact text. Unverified claims
are labeled and the labels travel with the work. Work for several
Refiners is **partitioned by disjoint file sets**; cross-cutting
changes stay on one branch under one Refiner.

## Findings (`findings.md`)

The evidence tape: the reviewer's verdict, and the implementer's
self-assessment (every deviation from the brief stated explicitly —
"no deviations" is stated, never implied). Committed **on the branch**.
When the reviewer cannot commit (a read-only session, another
harness, another model), it writes the file and Mark commits it with
both named in the attribution trailers. Findings are data: Mark
verifies their citations before acting on them.

## Status and closure

`status` lives in the brief: **`draft`** — planning paused for longer
than a session, the brief committed so another lane can resume;
**`pending`** — open; **`merged`** — closed by the integration. An open
branch holding a brief and no merge *is* a pending episode; nothing
else needs to be checked to know work is in flight.

## Integration: a plain merge, never a squash

The merge commit's message carries the gate result on the exact merge
candidate and Devon's authorization. **No squash, no fast-forward:**
every commit beneath the merge survives with its own author and
`Assisted-By:` line, in order. A Refiner may tidy its own
work-in-progress *before review*; the rule binds the integration step
only. `git log --first-parent` then reads one line per episode; plain
`git log` reads the commit grain.

## Interrupted episodes

Progress notes, partial findings with a status, or a draft brief are
committed on the branch before the session ends (constitution, Rule
8). On ephemeral lanes uncommitted work dies with the lane — commit
early, push the branch.

## Harness settings the convention depends on

- Refiners' worktrees branch from the **remote** default branch by
  default (verified 2026-10-28: a local repo four commits ahead of
  origin spawned a Refiner that could not see them). Consumers worked
  on from a local checkout set `worktree.baseRef: "head"` in project
  settings, or push before spawning.
- Worktree isolation is a **git** boundary, not a write boundary
  (verified 2026-10-28 in both the sandboxed local lane and the cloud
  VM): the harness refuses git commands aimed at the main checkout, but
  a plain file write into it succeeds. Briefs say "write only under
  your worktree"; a consumer may mechanize that with a pre-tool hook.
