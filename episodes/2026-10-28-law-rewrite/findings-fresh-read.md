---
type: Findings
title: Fresh-context read of the rewritten SPEC (first-use comprehension check)
description: A read-only Refiner given only the four SPEC sources, asked to restate the cast and the episode flow and to list contradictions and undefined terms; its report, and Mark's verification of each finding against the files.
timestamp: 2026-10-28
session: bare-local lane, Claude Code — a read-only Explore Refiner spawned by Mark, given no other context
model: claude-fable-5-1 (inherited)
trigger: the brief's verification section — "a fresh-context read: spawn a read-only subagent with only the new SPEC sources" (Devon approved the plan 2026-10-28)
branch: master
reviewer: a read-only Refiner (fresh context)
---

# Findings — fresh-context read

## Summary

The reader recovered the cast and the eight-step episode flow
correctly from the four files alone — the first-use comprehension
check passes. It reported six inconsistencies and eight undefined
terms. Mark verified every one against the files (Rule 6): all six
inconsistencies are real; of the eight terms, two were already defined
in place (OKF, `Assisted-By:` via the attribution convention in the
same SPEC) and six were not. All real findings were fixed in the
commit that carries this tape.

## Findings (the reader's, verbatim; Mark's verdict in brackets)

- F1 — episodes.md says "commit early, push the branch", but Rule 4
  says "Never `git push` ... without an explicit ask". *[VERIFIED,
  conventions/episodes.md:93 vs constitution.md Rule 4 — fixed: "ask
  Devon for the push (Rule 4)".]*
- F2 — Rule 1 says "A brief exists only because Devon approved a
  plan", but the `draft` status (episodes.md) is for "planning
  paused", which suggests a brief exists before approval. *[VERIFIED
  — fixed: Rule 1 now defines a draft brief as recording a paused plan
  that authorizes nothing.]*
- F3 — Tapes are "single-author" and "a reply is a new tape", yet one
  `findings.md` holds both the reviewer's verdict and the
  implementer's self-assessment. *[VERIFIED — fixed: one findings tape
  per author (`findings-<author>.md` when several); the constitution's
  self-assessment clause now says "a findings tape of its own". This
  tape's own name follows the fix.]*
- F4 — episodes.md says "Refiners (or Mark) implement"; constitution.md
  says only Refiners. *[VERIFIED, constitution.md flow step 3 — fixed:
  "or Mark itself, for work it authors — prose, configuration".]*
- F5 — index.md is "pending first, then merged" and has no place for
  `draft`. *[VERIFIED — fixed: a Draft section in the index; the
  convention now says "draft, then pending, then merged".]*
- F6 — "plain lane" and "master" vs "main branch" are used
  inconsistently. *[VERIFIED — fixed: the constitution defines "main
  branch (`master` or `main`)" and "plain lane: one session, no
  episode branch" where they first occur; the convention's frontmatter
  comment says "the main branch, in a plain lane".]*
- F7 — Terms used but never defined: OKF, plain lane, knowledge tree /
  knowledge note, RECORD (`conceit.md`), ask-rule, anchor ("an anchor
  is stale"), `Assisted-By:` trailer format, plan mode. *[Partly
  VERIFIED: OKF is defined at conventions/episodes.md:24 ("a markdown
  file with YAML frontmatter"); `Assisted-By:` is the attribution
  convention in this SPEC. Fixed the rest: knowledge tree defined in
  the convention; RECORD defined in the preamble; "ask-rule" replaced
  by "a harness rule that prompts before push" (constitution, profile
  contract); "anchor" replaced by "a cited location no longer matches
  the tree"; "plan mode" expanded to "the harness's planning mode
  (proposal only, no edits)".]*

## Checked and found correct (the reader's answers)

- Cast: Devon (authorizes), Mark (main session as one worker; runs
  the gate, integrates), Refiners, tapes, episode, the reviewer.
- Flow: plan → brief → implement → gate → review → fix and gate again
  → authorize → integrate with a plain merge, no squash.
- Stopping mid-work: Rule 8, status `draft`.
- Push: nobody without Devon's ask, in every lane.
- Verified claims found with their dates: Refiners branch from the
  remote by default; isolation stops git, not writes (both
  2026-10-28).

## Files opened

preamble.md, constitution.md, conventions/episodes.md,
profile-contract.md — nothing else, by instruction.
