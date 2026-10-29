---
type: Findings
title: Implementer's self-assessment — the law rewrite
description: Mark re-walks the steps actually taken against the brief, the SPEC and this repo's conventions, and reports every deviation, judgment call and latitude exercised; closes the episode.
timestamp: 2026-10-28
session: bare-local lane, Claude Code (the session named "the reintegration")
model: claude-fable-5-1
trigger: the constitution's "Self-assessment before hand-back", on the episode Devon opened with "let's start step 2, the law rewrite" (2026-10-28)
branch: master
reviewer: self
---

# Self-assessment

## Steps actually taken, against the brief

Commits 1–6 followed the brief's sequence exactly: brief + index
(`90f94f9`), episodes convention (`c0bced3`), constitution
(`8e76017`), conceit + preamble (`15cdbed`), profile contract + trace
note + MANIFEST (`147579b`), NOTES/DESIGN/CLAUDE (`5bb94cf`). The
brief's commit 7 (agy audit) became two commits: 7a, the fresh-context
read's fixes and tape (`8a0c622`), and 7b, agy's audit fixes and tape
(`2dd7ff7`). This commit is 8, the close. Every commit was prompted by
Devon; `make check` and the hygiene greps ran before each.

## Deviations and judgment calls — all of them

1. **The fresh-context read became a commit of its own (7a).** The
   brief listed it under Verification, not in the commit sequence. It
   produced six real findings, so its fixes and its tape were
   committed before the cross-model audit rather than folded into it.
   Latitude exercised; the audit then reviewed the fixed text.
2. **The token-budget check failed as written (F1).** The brief said
   the `[spec]` sources "must not grow"; they grew **3,878 → 4,925
   words** (+27%): the constitution shrank (2,281 → ~1,970) but the
   episodes convention (~750) and the audits' definitions and
   obligations (~350) outweighed it. Devon accepted 4,575 at commit 5
   on the design's actual yardstick — DESIGN.md's ≤ ~9k *loaded*
   tokens, calibrated at v0.1.0 as 4.6k words → 8.2k — and the two
   audits added words a cold reader demonstrably needed. By that ratio
   the SPEC now loads at ≈ 8.7k: inside the budget, with little
   headroom. Recorded in `reintegration.md`'s verification table; the
   loaded measurement in the first consumer session after release is
   the number that counts, and a trim episode is the remedy if it
   exceeds the budget.
3. **A trim pass on the convention was improvised at commit 5** (the
   "Why" section dropped as RECORD material, two sections shortened)
   — not in the brief; done to contain item 2.
4. **`reintegration.md` was edited** (commit 5: a verification-table
   row; this commit: the final count) though the brief's file list did
   not include it. The row records the budget decision; the brief's F1
   remedy required it.
5. **The audit prompt required a `reviewer:` frontmatter field** that
   the convention did not define; agy flagged it (F4) and the field is
   now law. An improvisation that became a rule — through review, as
   it should.
6. **agy's `model:` line was corrected by Devon** in the committed
   tape (self-reported from training data); the correction is visible
   in the frontmatter, not silent.
7. **Two edits failed on first attempt** (line-wrapping mismatches)
   and were re-applied from the file's exact text; no effect on the
   result. One `touch` probe during the experiments wrote and removed
   a file in the main checkout — reported at the time.
8. **Not done, as planned:** no phantom-untracked note in `CLAUDE.md`
   (lane-specific memory, not repo law); NOTES candidate 3
   (attribution reshuffle) left open; no release, no `VERSION` change.
9. **The brief contains the word "wall" twice** — its own rule text.
   The grep check is scoped to the SPEC sources, which are clean; the
   brief is the approved plan verbatim and was left as approved.
10. **Reviewer attribution was improvised.** Commit `2dd7ff7` carries
    `Assisted-By: Gemini 4 Argon (reviewing, via Antigravity)` beside
    the implementer's line — the role parenthetical and the harness
    note follow the first consumer's `be74b78` precedent, not a ruled
    format. NOTES candidate 3 (attribution beyond the dual lines)
    remains open; this is one more data point for it.

## Verification performed

- `make check` after every commit: DRIFT on both artifacts from
  commit 3 on, every hunk explained by the commits; `SEVERANCE.md`
  rebuilds from the new sources without build errors.
- Path hygiene greps empty at every commit; `wall` absent from the
  SPEC sources; `Outie`/`Innie` absent from the SPEC sources,
  present only in `severed-era.md`, `conceit.md`'s Retired cast,
  the register, `reintegration.md`, and historical notes.
- Fresh-context read: cast and the eight-step flow recovered cold
  (`findings-fresh-read.md`).
- Cross-model audit: ten findings, every citation verified by grep
  before any fix (`findings-agy.md`).

## What this episode taught (register candidates, for Devon's ruling)

- A self-reported VERIFIED label is a relayed claim — and so is a
  model's statement of its own identity.
- The first-use comprehension check finds what the author cannot:
  six inconsistencies invisible from inside the writing.
- A cross-model audit with a strict evidence rule produced zero
  fabrications where two surveys without one produced three each.
- Policing replaced by capability removal: the retired guards were,
  by their own note, the fallback for the topology that is gone.
- The word budget is the wrong instrument; the loaded measurement is
  the right one. Measure before trimming.

11. **A harness-added trailer leaked into history and was stripped.**
    Every commit of this episode (and the step-0 commit) carried a
    `Claude-Session:` link the harness asked for — user-specific
    metadata the attribution convention never sanctioned. Caught by a
    post-close leak scan Devon requested; on Devon's ruling ("the
    harness does not have priority over the law") the ten unpushed
    commits were rewritten to drop it, and the hashes cited in this
    episode's tapes, the index and `reintegration.md` were updated.
    Lesson: harness defaults in commit messages are stripped like
    `Co-Authored-By`, before the first commit, not after the tenth.

No other deviations.
