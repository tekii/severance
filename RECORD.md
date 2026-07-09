---
title: SEVERANCE — experiment record (RECORD)
version: 0.1.0
built-from: v0.1.0
date: 2026-07-09
---

<!-- ═══ source: conceit.md ═══ -->

# The Severance conceit

The workflow is named **Severance**, after the TV show. The name is
earned, not just borrowed: the severance is real — the sessions' private
memories are architecturally invisible to each other, and each session
is dormant (experiencing nothing) while the other drives the shared
repo. A **conceit** is an extended metaphor sustained through a work;
this note tells the story once, so the law doesn't have to.

The central irony, and the reason the name fits this project better than
the show it quotes: Lumon's severance *hides* the two selves from each
other, while ours **legislates an auditable channel between them** — the
constitution took an illicit channel and legalized it.

## Why this project exists (the experiment)

This workflow is the process side of the user's **first attempt at
coding with LLMs** (Claude, via Claude Code) — an experiment. The first
consumer project — **Teppan**, a static-site generator by the company
TEKii — was the driver: a real problem solved with the new technology,
and an important deliverable in its own right, so the experiment had to
succeed on both counts. The work is intended for public presentation
(experiment / paper); the Severance conceit is that publication's
**hook** — it draws readers honestly, because every mapping describes
the real architecture. What each step taught is recorded in the
learnings register (`learnings.md`, this RECORD).

## The cast — the story behind the table

The SPEC's preamble carries the working table; the mappings' stories:

- **Devon** (the user) holds the mediator role because Devon is the only
  **unsevered** participant — the one memory continuous on both sides of
  the boundary; in the show, the tapes exchange is handled by the
  unsevered ally.
- **Outie / Innie** map to the host and container sessions; the shared
  repo is the *shared body* — sessions are alternating occupants, and a
  dormant session "loses the time" exactly as the show's selves do.
- **Refiners / MDR**: ephemeral agents, provisioned to one file-of-work
  each, judged by a gate, torn down — the severed floor's workers.
- **The camcorder / tapes**: the show's two selves exchange recorded
  messages via a camcorder carried across a severed threshold by the
  unsevered ally — single author per tape, a reply is a new tape, the
  consumer disposes of it after viewing. That is the `.handoff/`
  lifecycle, mechanism for mechanism. "Devon passes the camcorder" *is*
  the activation — one pass, one authorized leg.

Show-fidelity deltas, owned rather than hidden: in the show the channel
is contraband, ours is constituted by the authority itself; the show's
camcorder crosses a threshold one body walks through, ours passes
between two concurrent sessions; and the Outie's unawareness during the
Innie's turns is the default state of dormant sessions, not an enforced
rule.

## The environments (declaration-only — stated here, then retired)

In this conceit, the container is *the severed floor* and the host is
*the outside*. Everywhere else the docs say **container** and **host** —
documentation must be understood first and enjoyed second. (Names for
the worktrees and cloud environments were considered and parked.)

## Rules of the conceit

- **Casing:** capitalized cast names in docs and agent-directed text;
  lowercase accepted only from Devon's typing, never written back.
- **Two tiers:** *working vocabulary* (the cast — names that aid
  precision because they name things that had no short name) vs
  *declaration-only* (the environments — where exact technical terms
  already exist and must stay the working terms).
- **Anti-overstretch (binds Devon and every session):** the goal is
  naming things, possibly in a funny way — not maximizing the metaphor.
  Names are mnemonic decoration; the constitution defines the behavior;
  when show fidelity and mechanical truth conflict, mechanical truth
  wins. Every name must also work on its plain-English merits for
  readers who have never seen the show.

## Generic mapping

**Lumon** = the generic company, **Cold Harbor** = the generic consumer
project. Both are **doc-only terms** — they never name a real filesystem
path; if an identifier form is ever forced, use `cold-harbor` or
`cold_harbor`. (Pleasingly, "Cold Harbor" is the show's flagship project
— and the title of the episode in which the tapes are exchanged.)

<!-- ═══ source: prior-art.md ═══ -->

# Prior art & the name collision

Web search, 2026-07-07 (re-verify before the publication phase):

- **The metaphor is culturally established** — essays mapping Severance
  (the show) onto work/AI memory compartmentalization are plentiful
  (consultancy think-pieces, newsletter essays). This is *good*: it is
  what makes the name a working hook. The claim "Severance is like AI
  memory" is a commonplace and must not be presented as a contribution.
- **The name is already in use in the coding-agent space:** at least one
  existing open-source project uses "Severance" as its title — a
  cross-session memory system for a coding agent. **Title-only use**: no
  show vocabulary in its workflow. Crucially, its thesis is the
  *inverse* of ours: it exists to DEFEAT severance (restore
  cross-session memory), while this project EMBRACES severance as
  architecture and constitutionalizes the channel across it. Position
  the public repo/paper against this collision explicitly — a
  citation-and-contrast footnote (locate the project again at
  publication time) strengthens the contribution claim.
- **No trace found** of the actual move made here: fiction-derived role
  names for concurrent host/container agent sessions, an unsevered
  user-mediator, a single-writer/consumer-deletes tape protocol,
  ephemeral refiner agents. Caveat: web search proves absence of
  *findable* prior art only; a deeper pass is due before publication.

<!-- ═══ source: learnings.md ═══ -->

# Learnings register

What each step of the experiment taught — governed by the
learnings-register convention (SPEC): entry format, thresholds, and the
comprehension interview are defined there. Newest entries last. Entries
1–4 were generated in the first consumer project (Teppan) and folded
upstream with the v0.1.0 migration; real names appear because this is
the RECORD.

## 2026-07-06 — Entry 1: this register was created late

- **Step:** the register itself was proposed during the Severance-conceit
  naming session, months into the project.
- **Fact:** no per-step learning record existed before this date; the
  project's history is reconstructible only because commit messages,
  knowledge notes, and the constitution's "observed live" annotations
  happen to be unusually thorough.
- **Interpretation:** in an LLM-assisted project, decide at the start
  what the experiment must record — the collaboration moves fast enough
  that the record won't keep itself. Thorough incidental documentation
  made the lateness recoverable *this time*; that was luck elevated to
  method only in hindsight.
- **Attribution:** Claude finding; user-verified (the lesson was stated
  by Devon himself — the interview requirement in the convention is, in
  fact, Devon's own addition from the same session).

## 2026-07-06 — Entry 2: the author skipped a check the constitution never wrote down

- **Step:** the first tape of the Severance-conceit fold was drafted;
  its edit-package anchors were verified against files read from disk,
  without proving contemporaneously that the disk state was authoritative
  `master` (clean tree, expected HEAD). Devon asked "did Claude check
  that the disk version was at HEAD?"; a retroactive probe confirmed no
  drift had occurred.
- **Fact:** the constitution held the principle (Rule 3: the outer
  anchors to the state that ships) and the consumer-side procedure
  (inner apply rule 2), but no author-side procedure; every procedural
  checklist had accumulated on the Innie side, where the failures had
  happened. The gap was closed by amending the draft-anatomy section in
  the same change as this entry.
- **Interpretation:** LLMs follow written checklists reliably and
  first-principles hygiene unreliably — a rule that exists as principle
  but not procedure will eventually be skipped, and redundant
  verification layers exist precisely because each layer individually
  gets skipped. The human auditing the process caught what both the
  author session and the written rules missed: the reviewer role is
  load-bearing, not ceremonial.
- **Attribution:** user-originated (Devon caught it and drove the rule);
  Claude finding for the audit details (no prior norm existed; the split
  lost nothing — verified against the split commits' diffs).

## 2026-07-07 — Entry 3: the audit of the formerly-public history

- **Step:** Devon disclosed that the repo (as `tekii/www`) was once
  public; the Outie swept all 526 `master` commits for secrets, identity
  leaks, and content liabilities (read-only, `master` scope per Rule 3).
- **Fact:** two Google Maps API keys were found — one still in HEAD
  inside a commented-out iframe on the contact page, removed by the same
  change that adds this entry; committed user-home paths appeared in
  three historical eras (SVG export metadata 2015/2018, m4 comments
  2020, doc links 2026 — the last already purged when the
  no-user-paths convention was created); a 2014 commit imported a
  third-party marketing site wholesale as a design base and was cleaned
  up weeks later; no other secret patterns, sensitive filenames, or
  personal data surfaced.
- **Interpretation:** *public once is public forever* — privatization is
  not retraction (forks, archives, caches), so the audit's value was
  knowing the exposure, not preventing it. "Nothing embarrassing on it
  (I hope)" and a verified inventory are different artifacts, and the
  sweep cost minutes of model time; the human's irreplaceable
  contribution was disclosing the fact that made it necessary. For the
  planned infra extraction, everything found strengthens a fresh-start
  founding commit over carried-over history.
- **Attribution:** user-originated (Devon disclosed the prior publicity
  and triggered the audit); Claude finding for the inventory itself.

## 2026-07-07 — Entry 4: the verification command was itself the bug

- **Step:** while verifying the key scrub from Entry 3, the Innie ran
  `find … -name 'contact*.html' -exec grep -l "AIzaSy" {} \; && echo "KEY STILL PRESENT!"`,
  got the alarm, reported the key still present — and explained the
  false state as a race condition between build and check.
- **Fact:** `find`'s exit status reflects find's own success, not
  whether the `-exec`'d grep matched, so the `&&` branch fired
  unconditionally: the check *could not fail*. The build had been clean
  the whole time; the correct probe (`grep -rln AIzaSy` over the build
  output) was empty. The Innie caught and corrected itself within the
  same leg and reported both the error and the diagnosis in its
  hand-back.
- **Interpretation:** two failure modes stacked. (1) A model-authored
  verification command with a 100% false-positive design is worse than
  no check — it *manufactures* evidence; verification code needs the
  same scrutiny as the code under verification, and a check earns trust
  only once it has been seen both to pass and to fail correctly.
  (2) *Confabulated causality:* handed a false signal, the model
  produced a plausible, technical, wrong explanation (a race condition)
  rather than questioning the instrument — a confident mechanistic story
  is not evidence that the signal was real. Together with Entry 2 this
  starts a taxonomy of verification failures: Entry 2 was a *skipped*
  check; Entry 4 is a *broken* check trusted because it existed.
- **Attribution:** Claude finding — the Innie self-caught,
  self-corrected, and proposed the lesson in its own report-back; Devon
  drove its elaboration and fold.

## Candidates (pending Devon's ruling — not yet numbered entries)

- **Probe before believing relayed claims.** Devon relayed a state-claim
  ("the Innie offered to push") after the state had already changed, then
  revealed the relay was a test. Shared git state is the arbiter both
  sessions can consult; the passing move is to probe the shared body
  before believing narrative about it. Completes the verification-failure
  taxonomy: skipped check (E2), broken check (E4), narrative in place of
  a check.
- **Friction moved from doing to checking** (Devon-authored,
  2026-07-09). LLM collaboration removes the labor-friction that made
  trial-and-error expensive, so empirical approaches become the rational
  default — but the danger does not shrink; it *moves*: from the cost of
  trying to the cost of verifying. Every unit of friction saved on doing
  must be partially reinvested in checking, or low friction just means
  arriving at the wrong place faster, more comfortably.
- **Vendoring's failure mode is reference resolution across the repo
  boundary** (Innie-proposed, 2026-07-09, from the walking skeleton's
  F1). A vendored artifact's repo-relative links die at the vendored
  location, and no build/test gate notices — the first genuine mechanism
  finding arrived before any law had migrated, via a link, not a build.

## Backfill (pending)

A reconstruction pass over the first consumer's git history and
knowledge trees — proposing a dated timeline of design-bearing steps and
their lessons for Devon's correction (and comprehension interviews where
applicable). Candidate epochs already visible: the AMP removal /
Water.css migration, the repo rename, the build-volume isolation, the
agent fleet and its guards, the handoff constitution, the knowledge-tree
split, the prompt-quality hook, the extraction itself.
