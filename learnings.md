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

## 2026-07-09 — Entry 5: the workflow migrated its own law, and survived operating on itself

- **Step:** the extraction migration ran in three phases — a mock-first
  walking skeleton (v0.0.x: release machinery + vendoring rehearsed with
  a content-free artifact), the law's generalization and release
  (v0.1.0), and the consumer-side surgery (a 12-package tape vendoring
  the SPEC, retiring 8 files, rewiring every survivor reference).
- **Fact:** every mechanism the workflow legislates was exercised *on
  the migration itself*: hash-pinned transfers (the inner session
  cannot see the upstream repo — the tape carried the artifact with
  digests at both ends), the authoritative-tree anchoring rule, the
  atomic gate, and — decisively — the refusal loop: the inner session
  held a 12-package tape over one dangling link rather than land 11
  clean packages around a defect invisible to the test gate.
- **Interpretation:** a process that cannot be applied to changing
  itself is ceremony; this one closed the loop — the walking skeleton
  caught its first real defect before any law moved, and the refusal
  loop caught the author's sweep miss after. The redundant verifier is
  not overhead; it is where the residual error rate actually went.
- **Attribution:** Claude finding (both sessions); Devon drove phase
  ordering, the mock-first proposal, and every boundary.

## 2026-07-09 — Entry 6: the incomplete sweep — a third verification-failure class

- **Step:** the migration tape's reference sweep grepped for
  path-prefixed link targets (`notes/learnings.md`); a same-directory
  link (`[learnings.md](learnings.md)`) slipped through. The inner
  session's independently-keyed sweep caught it and refused the tape.
- **Fact:** the sweep was a real check that could fail — and did fail
  to *look widely enough*: correct pattern, wrong key. The corrected
  bare-basename sweep found exactly one straggler; the fix was folded
  into a tape revision and the re-apply landed clean, with a zero-hit
  dangling-link sweep on the integrated result.
- **Interpretation:** the verification-failure taxonomy gains a third
  member — Entry 2 was a *skipped* check, Entry 4 a *broken* check,
  this is an **incomplete** check: one that can fail but examines too
  little, which is more insidious because it passes with conviction.
  Countermeasure observed working: *diversely-keyed* redundant checks —
  the authoring sweep and the verifying sweep used different patterns,
  and the union caught what neither alone guaranteed. Design checks for
  coverage diversity, not just existence.
- **Attribution:** Claude finding (the inner session's catch and root
  cause; the outer session's authoring miss); the refusal loop —
  Devon's constitution — is what turned the catch into a clean landing.

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
