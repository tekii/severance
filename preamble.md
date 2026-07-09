# SEVERANCE (SPEC)

**Severance** is a workflow for running multiple AI coding-agent
sessions against one shared repository without them trampling each
other or the truth: an **outer** session on the host, an **inner**
session in a hardened container, ephemeral worktree agents, and a user
who mediates every crossing. The severance is real — the sessions'
private memories are architecturally invisible to each other — so the
workflow *legislates* the one channel between them instead of
pretending it isn't needed. This document is the **binding law**; a
consumer project obeys it plus its own `profile.md` (see "The profile
contract", last section). The law is agent-vendor-neutral: it assumes
only sessions that read a repo, hold private memory, and load
configured context.

This artifact is generated — do not edit it; edit the sources in the
Severance repo and re-release. Links in it are absolute by law: it is
read from vendored locations where repo-relative paths are dead.

## The cast (working vocabulary — used throughout this law)

| Name | Is | Descriptive form (also valid) |
|---|---|---|
| **Devon** | the user | "the user" |
| **Outie** | the outer/host session | "the outer session" |
| **Innie** | the inner/container session | "the inner session" |
| **Refiners** | spawned agents (worktree / fleet / subagent children) | "agents" |
| **MDR** | the Refiner fleet, collectively | "the fleet" |
| **the camcorder** | `.handoff/` (the literal path remains the real name) | "the handoff channel" |
| **tapes** | `.handoff/` artifacts (`plan-*`/`draft-*`/`findings-*`) | "handoff artifacts" |

Casing rule: docs and agent-directed text always write these names
capitalized; lowercase forms are accepted only when Devon types them —
never write them back. The names' story, and the anti-overstretch
principle governing them, live in the RECORD (`conceit.md` upstream) —
law here, lore there. Generic names used in this law's examples:
**Lumon** = the generic company, **Cold Harbor** = the generic consumer
project (doc-only terms; they never name a real filesystem path).

## Adoption, in brief

1. Vendor this file into your repo (commit the copy; its `version`
   frontmatter is your pin; update = replace file, diff, commit).
2. Write `profile.md` beside it answering the profile contract.
3. Load this file into every session's context (via your agent
   harness's auto-loaded configuration); keep the RECORD out of session
   context — it is for humans.
