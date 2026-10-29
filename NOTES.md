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

## Graduated (v0.2.0)

- **"Probe before proposing" as a general rule** → constitution.md new
  section "State is probed, not assumed" (register Entry 8 generalized
  to all sessions in all lanes; the author-side anchoring bullet and
  the session-memory expiry rule named as its instances).
- **Subagents-inherit awareness sentence** → constitution.md
  "Subagents inherit" now warns a spawned agent may hold none of the
  law or a stale snapshot — verify or inject, see the profile (register
  Entry 7, vendor-neutral; harness mechanics stay in consumer
  profiles).

## Graduated (next release — the reintegration, 2026-10-28)

- **No experiments in the shared working tree** → constitution.md
  Rule 7 (Devon's ruling at the law-rewrite plan).
- **Mandatory self-assessment on every tape application** →
  constitution.md "Self-assessment before hand-back" (same ruling).
- **Sandbox for the Outie** → resolved by the lane model: the bare
  host is one lane with the per-command sandbox as its boundary;
  per-lane boundaries are the profile's business (profile-contract
  "Lanes"; `reintegration.md`).
- **Who updates the vendored package in consumers** → resolved: any
  lane vendors (every lane has its own clone); no tape ceremony; Rule 4
  governs the push.

## Open items

- **SPEC graduation candidate (v0.2.x): the auto-load ritual** — the
  first consumer's profile now generalizes the long-session snapshot
  caveat ("after integrating a change to any auto-loaded config file,
  restart or re-read before relying on it — the landing session
  included") and co-locates the C-6 obligation; the SPEC's own
  long-session note (profile-contract territory / subagents clause)
  should echo it vendor-neutrally.
- **Lesson → convention graduation hierarchy** (Devon's future ask, his
  trigger): document how register entries (case-law) graduate into
  binding conventions (law); precedent: Entry 2 → the constitution's
  draft-anatomy bullet. Natural home: this repo's docs.
- **Assets deferred from the SPEC** (v0.1.x): the consumer machinery
  (container config, fleet scripts, guards) still lives, ungeneralized,
  in the first consumer's repo. Generalizing it into `[spec.assets]`
  extractable blocks is future work — likely v0.2.x.
- **"Report-back by exception"** — discussed and deliberately left
  unadopted (Devon self-tracks); silence-must-be-a-contract caveat
  recorded in the session that raised it.
- **No experiments in the shared tree** and **mandatory
  self-assessment** → graduated (block above). Their incident
  evidence — the first consumer's `driver.m4` overwrite of an
  untracked file (2026-07-23) and the two voluntary self-disclosures
  (2026-07-13, 2026-07-23) — remains the learnings-register candidate
  pair.
- **SPEC candidate: attribution beyond the dual lines — reviewers,
  non-cast participants, and Devon's reshuffle idea** (Devon's trigger,
  2026-07-24). Precedent: the first consumer's `be74b78` carries three
  trailers — `(drafting)` Fable 5, `(reviewing)` Gemini 3.5 Flash,
  `(applying)` Opus 4.8 — exceeding both the SPEC's attribution section
  (which only rules Assisted-By over Co-Authored-By) and the consumer's
  dual-line apply rule. Four questions currently answered by
  improvisation: (1) **role vocabulary** — propose an open-but-meaningful
  set of role parentheticals, one line per participant, in pipeline
  order (drafting → reviewing → applying); (2) **threshold** — a line
  for any AI participant whose contribution is visible in the artifact
  chain (tape provenance, findings, applied edits); (3)
  **cast-independence** — attribution is orthogonal to the cast (a
  reviewer that is neither Outie/Innie/Refiner still gets its line);
  the workflow rules do NOT thereby extend to non-cast participants;
  (4) **the single-writer wrinkle** — reviewer input enters via Devon
  or via the reviewer's own artifacts; a Devon-mediated edit to the
  author's provenance header is the sanctioned form (Devon's
  prerogative, not an exception to single-writer). **Devon's reshuffle
  seed (his framing, to iterate before ruling):** restructure the line
  format along the lines of `MODEL/ROLE on behalf of AUTHOR` for the
  agent making the commit — i.e. the trailer names the acting model
  *and* its role *and* whose authority it acted under, rather than
  today's flat `Assisted-By: Model (role)` lines. Open sub-questions
  for that iteration: does `on behalf of` name Devon (the human
  authority) or the drafting session (the content author)? does the
  git author/committer identity itself change, or only the trailers?
  and does the format stay `Assisted-By:`-prefixed for tool/forge
  compatibility? Natural home once ruled: the SPEC's "Git commit
  attribution" section, `be74b78` cited as precedent.
