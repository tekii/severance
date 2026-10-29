---
type: Brief
title: Law rewrite — Severance → Unsevered (step 2 of the migration)
description: The approved plan for rewriting the SPEC's sources from the outer/inner handoff to the episode flow, per reintegration.md; the first episode record of this repo.
timestamp: 2026-10-28
session: bare-local lane, Claude Code (the session named "the reintegration")
model: claude-fable-5-1
trigger: "let's start step 2, the law rewrite" (Devon, 2026-10-28); plan approved in plan mode the same day with two rulings — commits on master; fold NOTES candidates 1 and 2, leave 3 open
branch: master (Devon's ruling — the plain lane; no episode branch, no merge commit)
status: pending
---

# Law rewrite — Severance → Unsevered (step 2 of the migration)

## Context

`reintegration.md` (committed `5718a80`) records the migration's
decisions. This episode turns them into law: the SPEC's sources are
rewritten so a consumer session, in any lane and either harness, obeys
the episode flow instead of the outer/inner handoff. Devon's rulings
for this episode: **commits on master** (plain lane, Devon prompts each
commit — no episode branch, no merge commit); **fold NOTES candidates 1
(no experiments in the shared tree) and 2 (mandatory self-assessment);
leave 3 (attribution reshuffle) open.** agy audits the rewrite before
it is declared done. Nothing is released here; step 4 bumps `VERSION`.

Ground rules for the text: plain-English merits first; cast
capitalized, plain nouns lowercase; technical terms for lanes (sandbox
/ container / VM), "boundary" abstractly, never "wall"; Lumon / Cold
Harbor in examples; no user paths; unverified claims labeled, never
upgraded; the SPEC stays within its token budget (DESIGN.md downside 5:
≤ ~9k measured — target: no larger than today's SPEC sources,
`wc -w` before/after).

## Files

| File | Action |
|---|---|
| `episodes/2026-10-28-law-rewrite/brief.md` + `episodes/index.md` | **new** — this plan, with OKF frontmatter (`type: Brief`, session/model, trigger, `status: pending`); the first episode record, bootstrapping `episodes/` |
| `conventions/episodes.md` | **new** — the episode convention (below) |
| `constitution.md` | **rewrite** (filename kept: path = concept identity; the law is still the constitution) |
| `conceit.md` | **rewrite** — cast Devon + Mark + Refiners; environments → lanes; camcorder → tapes kept; enlarged deltas paragraph (temporal split; reintegration = the migration, partial in the show; episode/brief coincidences) |
| `preamble.md` | **rewrite** — what Unsevered is, cast table, adoption steps (vendor, profile, load; `worktree.baseRef: "head"` on local repos) |
| `profile-contract.md` | **rewrite** — required sections: Gate; Lanes (one entry per lane: boundary, reach, how Rule 7 is enforced, harness law surface + hook file + sandbox grants); Episode mechanics (where briefs land, how the gate is run on the merge candidate, who may integrate); Reviewer (which model/agent, read-only enforcement); Implementation docs. Hygiene preconditions and sanctioned flow become consumer-optional, not required |
| `severed-era.md` | **new, [record]** — the trace note for retired machinery: tape lifecycle, closed side-channels C-1..C-11, draft anatomy, inner apply rules, Rule 3, "why not let the outer commit" — mechanics, why each lost (capability removal / lane change), revisit triggers |
| `MANIFEST` | `[spec]` += `conventions/episodes.md`; `[record]` += `severed-era.md` (after `reintegration.md`) |
| `NOTES.md` | move candidates 1–2 to a "Graduated (next release)" block; mark the Outie-sandbox and vendored-package items as resolved by the migration; keep 3 open |
| `DESIGN.md` | one dated paragraph under "What this project is": superseded in part by `reintegration.md`; constraint 2 restated (plain lane stays) |
| `CLAUDE.md` | minimal: "No Devon here, no Outie either" → "no cast roles here"; add the phantom-untracked note? **no** — that is lane-specific memory, not repo law |

## The new constitution — section outline

1. **What binds whom.** Mark (any main session, any lane, either
   harness), Refiners, the reviewer. Precedence: live user instruction
   > SPEC + consumer conventions > a brief.
2. **Rules / invariants.**
   - R1 *Every episode is user-triggered* (Rule 1 generalized): a brief
     exists only on Devon's approval of a plan; one approval authorizes
     one episode; integration and push need their own authorization.
   - R2 *The record is the only channel across sessions* (Rule 2
     generalized): what one Mark leaves for the next is a tracked file —
     brief, findings, notes, commits. Harness mailboxes, plan files and
     private memory are relays, not records. The deletion test kept.
   - R3 *State is probed, not assumed* (unchanged, promoted to a rule).
   - R4 *Push and anything irreversible are user-authorized* (Rule 7,
     lane-independent; the profile names each lane's enforcement).
   - R5 *One Mark per checkout at a time*; concurrent work goes to a
     worktree.
   - R6 *Evidence, not claims*: the gate is run by the integrator on the
     exact merge candidate; a relayed "it passed" and a self-reported
     VERIFIED label are claims to re-verify; reviewers' citations are
     checked before they are acted on.
   - R7 *No experiments in the shared tree* (NOTES candidate 1):
     scratch to session-private storage by absolute path; writes never
     depend on an earlier `cd`.
   - R8 *State written before stopping*: whatever the next Mark needs is
     committed on the episode branch before the session ends.
3. **The episode flow** — plan → brief → implement (Refiners) → gate →
   review → fix → authorize → integrate (plain merge, no squash; the
   merge message carries gate result + authorization). Reading modes.
4. **Briefs** — requirements, constraints, decisions and acceptance
   checks; verbatim prescription where load-bearing (resist-collapse
   rule carried over whole, incl. "binds any command sequence");
   partition by disjoint file sets; label unverified claims.
5. **Refiners inherit** (carried over; Entry 7): bound by accountability
   not knowledge; inject the law verbatim; isolation is a git boundary
   not a write boundary (verified) — write only under your worktree.
6. **Self-assessment** (NOTES candidate 2): after implementing a brief
   and before hand-back, re-walk the steps against SPEC + profile and
   report every deviation explicitly — "no deviations" stated, never
   implied; travels in the findings.
7. **The reviewer** — unanchored; read-only; briefed with the diff and
   the brief, not Mark's conclusions; cross-model when available; its
   output is data.
8. **Refuse by handing back, never silently** (carried over).
9. **Session memory hygiene** (carried over; `.handoff/` references →
   the episodes index).
10. **Lanes** — the isolation clause is per lane and lives in the
    profile; the law assumes only: a clone, a boundary, a way to run
    the gate. Three documented lane kinds (VM, container, sandbox).

## `conventions/episodes.md` — content

The unit (episode = the branch); `episodes/<date>-<topic>/` beside the
knowledge tree, own `index.md`, out of the default load; tapes (brief,
findings) with frontmatter fields (`type`, `title`, `description`,
`timestamp`, `session`, `model`, `trigger`, `branch`, `status:
draft|pending|merged`); the brief as a derived artifact (approved plan
+ frontmatter, first commit); findings committed on the branch (by Mark
when the reviewer cannot commit, with dual attribution); status flipped
by the merge; no squash at integration (a Refiner may tidy its own
work-in-progress before review); `--first-parent` as the episode
history; no numbering/seasons; interrupted episodes (draft brief,
progress committed on the branch); `worktree.baseRef: "head"` on local
repos (verified: default branches from `origin/<default>`).

## Commit sequence (each on Devon's prompt; `make check` DRIFT stated)

1. `episodes/`: brief + index.
2. `conventions/episodes.md`.
3. `constitution.md`.
4. `conceit.md` + `preamble.md`.
5. `profile-contract.md` + `severed-era.md` + `MANIFEST`.
6. `NOTES.md` + `DESIGN.md` + `CLAUDE.md` touch-ups.
7. agy audit: Devon relays a review prompt (diff of the SPEC sources vs
   `v0.3.1`, the brief, the labels rule); findings land as
   `episodes/2026-10-28-law-rewrite/findings.md`; fixes; brief
   `status` stays `pending` until step 4's release merges nothing — in
   the master-commits shape, `status: merged` is set by the commit that
   closes the episode (commit 8).
8. Close: findings + status flip.

## Verification

- `make check` after every commit: DRIFT expected on both artifacts
  now (SPEC sources change), all `+`/`-` explained by the commits.
- Path hygiene greps empty; `git grep -niw wall` empty in sources;
  `git grep -n 'Outie\|Innie'` only in `severed-era.md`, `conceit.md`
  deltas, `learnings.md` and `reintegration.md`.
- Token budget: `wc -w` of `[spec]` sources before vs after; must not
  grow (target: shrink — retired sections outweigh added ones).
- Every claim in the law that rests on a 2026-10-28 experiment cites
  it as verified; anything else labeled.
- agy's findings verified by Mark before any fix (R6 applied to its
  own audit); its fabricated-quote pattern expected — every citation
  checked against the file.
- A fresh-context read: spawn a read-only subagent with only the new
  SPEC sources and ask it to state the episode flow and the three
  cast names — the first-use comprehension check from the register.
