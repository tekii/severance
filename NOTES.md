# NOTES — session-salvaged items not covered by DESIGN.md

**Status: PRELIMINARY.** Written 2026-07-07 by the outer Teppan session
(Claude, `claude-fable-5`) on Devon's instruction, alongside
[DESIGN.md](DESIGN.md). Three items that existed only in that session's
conversation and would otherwise be lost to the future sessions working
in this repo.

## 1. Prior art & the name collision (publication-relevant)

Web search, 2026-07-07 (re-verify before the publication phase):

- **The metaphor is culturally established** — essays mapping Severance
  (the show) onto work/AI memory compartmentalization are plentiful
  (consultancy think-pieces, Substack essays). This is *good*: it is
  what makes the name a working hook. The claim "Severance is like AI
  memory" is a commonplace and must not be presented as a contribution.
- **The name is already used in the Claude Code space:**
  `github.com/blas0/Severance` ("Unsevered Memory") — a semantic memory
  system for Claude Code. **Title-only use**: zero show vocabulary in
  its workflow. Crucially, its thesis is the *inverse* of ours: it
  exists to DEFEAT severance (restore cross-session memory), while this
  project EMBRACES severance as architecture and constitutionalizes the
  channel across it. Position the public repo/paper against this
  collision explicitly — a citation-and-contrast footnote strengthens
  the contribution claim.
- **No trace found** of the actual move made here: fiction-derived role
  names for concurrent host/container AI sessions, an unsevered
  user-mediator, a single-writer/consumer-deletes tape protocol,
  ephemeral refiner agents. Caveat: web search proves absence of
  *findable* prior art only; a deeper pass (e.g. a research harness) is
  due before publication.

## 2. Learnings Entry 5 — CANDIDATE, awaiting Devon's ruling

Not yet in the register (Teppan `knowledge-infra/notes/learnings.md`);
if adopted, it completes a taxonomy of verification failures: Entry 2 =
a *skipped* check; Entry 4 = a *broken* check; Entry 5 = *narrative
accepted in place of a check*.

Draft:

> **Entry 5: the mediator can test either self.** Devon relayed to the
> Outie that "the Innie offered to push" after the Outie had already
> pushed — then revealed the relay was a test. Because both sessions
> share one `.git`, a push from either side updates the shared
> remote-tracking ref: any session that probes before speaking sees the
> truth. The passing move — and the lesson — is to **probe the shared
> state before believing a relayed claim about it**. In a severed
> workflow the mediator's relays are the one channel that carries
> unverifiable narrative; the shared body (the repo) is the arbiter
> that keeps everyone honest.

## 3. Learnings candidate — friction moved from doing to checking (Devon-authored)

Proposed by Devon 2026-07-09 (the register's first user-originated
lesson; Claude-refined). Draft:

> LLM collaboration removes the labor-friction that made trial-and-error
> expensive, so empirical approaches — mocks, rehearsals, audits,
> rewrites — become the rational default. But the danger does not
> shrink; it *moves*: from the cost of trying to the cost of verifying.
> Cheap trials produce cheap errors at the same rate, so every unit of
> friction saved on *doing* must be partially reinvested in *checking* —
> otherwise low friction just means arriving at the wrong place faster,
> more comfortably.

Context: proposed while adopting the mock-first phase 0 of this very
migration; it also explains retroactively why the workflow's
verification ritual kept thickening as production got cheaper (Entries
1–4 of the Teppan register are all instances).

## 4. Open documentation ask — the lesson → convention graduation hierarchy

Devon intends to request (his trigger, timing his) a doc formalizing how
workflow knowledge hardens: **register entry (case-law) → convention
(law)**, with the precedent already on record: Teppan learnings Entry 2
graduated into the constitution's "prove the tree authoritative before
anchoring" bullet in the same change that recorded it. Natural home:
this repo's docs, since it is law about the workflow's law. Related,
Devon-tracked (not to be re-proposed uninvited): the "report-back by
exception" idea for the constitution, discussed and deliberately left
unadopted on 2026-07-07.
