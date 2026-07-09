# NOTES — working notes & open items (not shipped in any artifact)

**Status:** maintained alongside DESIGN.md; items graduate out of here
into sources (SPEC/RECORD), the MANIFEST, or decisions — and get
replaced by one-line pointers when they do.

## Graduated

- **Prior art & name collision** → folded into the RECORD as
  `prior-art.md` at v0.1.0 (de-identified per Devon: facts retained,
  the colliding project not named; re-locate it at publication time).
- **Entry 5 candidate (probe before believing relayed claims)** and the
  **friction lesson (Devon-authored)** → imported into `learnings.md`'s
  "Candidates" section at v0.1.0, pending Devon's ruling to number them.
  The Innie's **F1 vendoring lesson** joined them.

## Graduated (v0.1.1)

- **OKF-conformant artifact frontmatter** → build.sh emits
  type/title/description/tags/timestamp + version pins (SPEC
  `Convention`, RECORD `Reference`); consumers become conformant on
  re-vendoring v0.1.1 (Devon's requirement: the consumer side must be
  OKF-valid).
- **Token budget recalibrated** → DESIGN.md downside #5 now states the
  harness-measured reality (8.2k loaded at v0.1.0; budget ≤ ~9k
  measured; word×1.3 underestimates markdown ~×2.3).
- **Agents-don't-load-law register fold** → Entry 7 (user-originated;
  model finding for the probes; Devon's accidental-mistake scoping).

## Open items

- **SPEC graduation candidate (v0.2.x): "probe before proposing" as a
  general rule** — binding all sessions in all lanes (register Entry
  8); the constitution's author-side "prove the tree authoritative
  before anchoring" becomes its named instance. Ships with the
  subagents sentence below.
- **SPEC graduation candidate (next SPEC-bearing release):** one
  vendor-neutral sentence in the constitution's "Subagents inherit"
  clause — *"do not assume a spawned agent has this law in context —
  verify or inject; see your profile"* — generalizing the
  agents-don't-load-law finding (2026-07-09, user-originated; the
  harness-specific mechanics stay in consumer profiles; the first
  consumer's profile has the model section).
- **Lesson → convention graduation hierarchy** (Devon's future ask, his
  trigger): document how register entries (case-law) graduate into
  binding conventions (law); precedent: Entry 2 → the constitution's
  draft-anatomy bullet. Natural home: this repo's docs.
- **Assets deferred from the SPEC** (v0.1.x): the consumer machinery
  (container config, fleet scripts, guards) still lives, ungeneralized,
  in the first consumer's repo. Generalizing it into `[spec.assets]`
  extractable blocks is future work — likely v0.2.x.
- **Who updates the vendored package in consumers** (Devon,
  post-migration review): today's topology forces outer-carries /
  inner-lands; revisit whether tape ceremony stays proportionate for
  hash-guarded version bumps — and note the answer changes for
  container-less consumers.
- **"Report-back by exception"** — discussed and deliberately left
  unadopted (Devon self-tracks); silence-must-be-a-contract caveat
  recorded in the session that raised it.
