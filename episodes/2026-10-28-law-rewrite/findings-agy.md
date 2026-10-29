---
type: Findings
title: Audit of the law rewrite (step 2 of the reintegration)
description: Read-only cross-model audit of preamble.md, constitution.md, conventions/episodes.md, and profile-contract.md against v0.3.1, reintegration.md, episodes/2026-10-28-law-rewrite/brief.md, and severed-era.md.
timestamp: 2026-10-28
session: agy (Antigravity CLI, native Linux lane), read-only audit
model: Gemini 4 Argon — corrected by Devon; the auditor self-reported "gemini-3.1-pro-high (Antigravity CLI 2.0.70)" from training data (the CLI on disk is 1.4.9 by Mark's check)
trigger: "\"You are the AUDITOR for one episode of this repo. Read-only: do not create, edit, commit or push anything in the repository; run no build. […] SUBJECT. The repo's SPEC sources were rewritten today from the first workflow (tag v0.3.1) to its successor. Review: preamble.md, constitution.md, conventions/episodes.md, profile-contract.md against their previous versions\" (Devon, relaying Mark's audit prompt, 2026-10-28)"
branch: master
reviewer: agy
---

*Mark's note: agy returned this tape's text; Mark wrote and committed
it (episodes convention). Two edits besides the frontmatter model
line: absolute paths in "Files opened" made repo-relative (path-hygiene
convention), and the four-space indentation of the relay removed.
Mark's verification of each finding follows the auditor's text. Later
the same day, on Devon's ruling, the ten unpushed commits of this
episode were rewritten to drop a harness-added session-link trailer
from their messages; the commit hashes quoted in this tape were
updated to the rewritten ones (the auditor cited `98b4570`, now
`8a0c622`).*

# Findings

## Summary
Overall verdict: **pass with should-fix adjustments (0 blocking, 8 should-fix, 2 nit).**
The rewritten SPEC sources (`preamble.md`, `constitution.md`, `conventions/episodes.md`, `profile-contract.md`) at `HEAD` (`8a0c622`) faithfully implement the Unsevered episode architecture, the eight rules, the conceit vocabulary, and the retired-machinery trace in `severed-era.md`.
The remaining issues are internal edge-case inconsistencies (`status` on interrupted findings, multi-author `findings-<author>.md` naming, non-committing reviewer mechanics), one `v0.3.1` C-6 obligation claimed as surviving in `severed-era.md` but absent from the law, two Claude Code-only probes stated as general harness facts, and three operational gaps a cold consumer session would hit when writing `profile.md` or running an episode branch.

## Findings

### F1 — should-fix — `episodes/2026-10-28-law-rewrite/brief.md:140-141` — VERIFIED

> `- Token budget: wc -w of [spec] sources before vs after; must not`
> `  grow (target: shrink — retired sections outweigh added ones).`

The `[spec]` sources listed in `MANIFEST` grew from `3,878` words at `v0.3.1` to `4,675` words at `HEAD` (`8a0c622`), a 20.6% increase that fails the brief's stated acceptance check (`must not grow`), and `reintegration.md:228` still records the earlier `4,575` word count prior to commit `8a0c622`.
Record this word-count growth (`3,878` → `4,675` words) and the rationale for accepting it under `DESIGN.md:150`'s `≤ ~9k` token budget in the episode's self-assessment, and update `reintegration.md:228` to match the final word count.

### F2 — should-fix — `episodes/2026-10-28-law-rewrite/brief.md:78-80` and `constitution.md:102-125` — VERIFIED

> `3. **The episode flow** — plan → brief → implement (Refiners) → gate →`
> `   review → fix → authorize → integrate (plain merge, no squash; the`
> `   merge message carries gate result + authorization). Reading modes.`

The brief's outline for `constitution.md` section 3 ("The episode flow") calls for "Reading modes" (`git log --first-parent` vs plain `git log`), which was placed in `conventions/episodes.md:88-89` (`git log --first-parent then reads one line per episode; plain git log reads the commit grain.`) and omitted from `constitution.md:102-125`.
Either add a clause on `--first-parent` vs full-log reading modes to `constitution.md:119-120`, or note in the episode's self-assessment that reading modes were consolidated into `conventions/episodes.md:88-89`.

### F3 — should-fix — `conventions/episodes.md:37` and `conventions/episodes.md:93` — VERIFIED

> `status:       draft | pending | merged      (briefs only)`
>
> `Progress notes, partial findings with a status, or a draft brief are`
> `committed on the branch before the session ends (constitution, Rule`
> `8).`

`conventions/episodes.md:37` restricts the `status` frontmatter key to `(briefs only)` (narrowing `episodes/2026-10-28-law-rewrite/brief.md:105-108` and `reintegration.md:89`), yet `conventions/episodes.md:93` still instructs committing `"partial findings with a status"` on an interrupted episode without allowing `status` on `Findings` tapes or defining valid values for it.
Either change `"partial findings with a status"` in `conventions/episodes.md:93` to `"partial findings"` so `status` remains strictly on `brief.md`, or allow `status` on `Findings` tapes in `conventions/episodes.md:37` and name its permitted values.

### F4 — should-fix — `conventions/episodes.md:28-38`, `conventions/episodes.md:68-70`, and `constitution.md:182-183` — VERIFIED

> ```
> type: Brief | Findings
> title:
> description:
> timestamp:    date written
> session:      lane + harness (e.g. "web lane, Claude Code")
> model:        the model id that wrote it
> trigger:      Devon's instruction, quoted or tightly paraphrased, with its date
> branch:       the episode branch (or the main branch, in a plain lane)
> status:       draft | pending | merged      (briefs only)
> ```
>
> `When the reviewer cannot commit (a read-only session, another`
> `harness, another model), it writes the file and Mark commits it with`
> `both named in the attribution trailers.`
>
> `A reviewer that cannot commit writes the file and Mark`
> `commits it, both named in the attribution.`

A strictly read-only reviewer session (or a reviewer in another clone or lane) cannot write a file into Mark's checkout at all — as in this audit, it returns the markdown text for Devon or Mark to write and commit; additionally, the prompt for this audit required a `reviewer:` frontmatter field on `findings.md` that is not in `conventions/episodes.md:28-38`.
In `conventions/episodes.md:68-70` and `constitution.md:182-183` (and `profile-contract.md:47-48`), allow a non-committing reviewer to either write the file or return the tape text for Mark to write and commit, and add `reviewer:` (or mark it `(findings only)`) in `conventions/episodes.md:28-38` if desired.

### F5 — should-fix — `constitution.md:171-173`, `conventions/episodes.md:65-67`, and `episodes/index.md:13-14` — VERIFIED

> `conventions, and **reports the result explicitly** in a findings tape`
> `of its own: every deviation, judgment call, improvisation or latitude`
> `exercised — and "no deviations" stated, never implied.`
>
> `Each author writes its own`
> `tape — findings.md when there is one, findings-<author>.md when`
> `there are several — never a shared one.`
>
> `<date>-<topic>/ directory holding its tapes: brief.md (intent)`
> `and findings.md (evidence).`

Every standard episode has at least two distinct findings authors — the implementer writing its mandatory self-assessment (`constitution.md:171-173`) and the independent reviewer writing its review verdict (`constitution.md:177-183`) — so under the single-writer rule (`conventions/episodes.md:40`, `65-67`) any episode with both will produce multiple `findings-<author>.md` files rather than a single `findings.md`.
Specify in `conventions/episodes.md:65-67` what `<author>` slug convention to use when both implementer self-assessment and reviewer findings exist (e.g. `findings-self.md` / `findings-<reviewer>.md`), and update `episodes/index.md:13-14` so it does not imply a single `findings.md`.

### F6 — should-fix — `severed-era.md:56-58` and `severed-era.md:67-68` — VERIFIED

> `C-6 config the other session auto-loads (prompt`
> `injection by editing the harness's includes; changes to auto-loaded`
> `config always named to the user);`
>
> `C-6 survives in spirit as the`
> `"Refiners inherit" caution and the auto-load ritual;`

`v0.3.1:constitution.md` C-6 required that `"changes to auto-loaded config are always named to the user before integration"`, and `severed-era.md:67-68` claims C-6 survives as `"the 'Refiners inherit' caution and the auto-load ritual"`, but neither the obligation to name auto-loaded config changes before integration nor the auto-load ritual appears in `preamble.md`, `constitution.md`, `conventions/episodes.md`, or `profile-contract.md` (and `NOTES.md:58-64` still lists the auto-load ritual under `## Open items`).
Either restore a one-line requirement in `constitution.md` that edits to tracked auto-loaded harness files (`CLAUDE.md`, `AGENTS.md`, `.claude/`, `.agents/`) be named to Devon before integration, or amend `severed-era.md:67-68` to accurately trace its retirement/deferral to `NOTES.md`.

### F7 — should-fix — `preamble.md:52-55`, `constitution.md:160-163`, and `conventions/episodes.md:100-108` — VERIFIED

> `- Refiners' worktrees branch from the **remote** default branch by`
> `  default (verified 2026-10-28: a local repo four commits ahead of`
> `  origin spawned a Refiner that could not see them). Consumers worked`
> `  on from a local checkout set worktree.baseRef: "head" in project`
> `  settings, or push before spawning.`
> `- Worktree isolation is a **git** boundary, not a write boundary`
> `  (verified 2026-10-28 in both the sandboxed local lane and the cloud`
> `  VM): the harness refuses git commands aimed at the main checkout, but`
> `  a plain file write into it succeeds.`

Both verified claims in `conventions/episodes.md:100-108` and `constitution.md:160-163` (`"the harness refuses git commands aimed at the main checkout"`, and Refiners branching from the remote default branch by default) were probed on 2026-10-28 **only in Claude Code** (`reintegration.md:216-220`), yet `conventions/episodes.md:100-108` and `constitution.md:160-163` state them as unqualified facts about any harness without naming Claude Code.
Attribute both `2026-10-28` probes in `constitution.md:160-163` and `conventions/episodes.md:100-108` specifically to Claude Code (`verified 2026-10-28 in Claude Code`), or label other harnesses' worktree base-ref and main-checkout git enforcement as unverified.

### F8 — nit — `conventions/episodes.md:47-48` — VERIFIED

> `Harness plan files live outside the repo and have no frontmatter; the brief is`
> `how a plan enters the record, and the only way a plan crosses lanes.`

Stating unconditionally that harness plan files `"live outside the repo and have no frontmatter"` over-generalizes the 2026-10-28 local Claude Code check (`reintegration.md:221` notes Claude Code's `plansDirectory` can be configured relative to the project root, and Antigravity plan artifacts carry metadata).
Qualify `conventions/episodes.md:47-48` with `"By default, harness plan files live outside the repo and carry no episode frontmatter"`.

### F9 — nit — `preamble.md:23-35` — VERIFIED

> `## The cast (working vocabulary — used throughout this law)`
>
> `| Name | Is | Descriptive form (also valid) |`
> `|---|---|---|`
> `| **Devon** | the user — the sole authorizer | "the user" |`
> `| **Mark** | the main session, as one worker across sessions and lanes | "the main session" |`
> `| **Refiners** | agents a session spawns (worktree implementers, read-only reviewers, probes) | "agents" |`
> `| **tapes** | the single-author files of an episode: the **brief** and the **findings** | "the episode's files" |`
> `| **episode** | one unit of asked work: brief → branch → gate → review → merge | "a unit of work" |`
>
> `Casing rule: docs and agent-directed text always write the cast names`
> `capitalized; lowercase forms are accepted only when Devon types them —`
> `never write them back.`

Placing `tapes` and `episode` inside the table titled `## The cast` and immediately following it with `"always write the cast names capitalized"` leaves a cold reader to infer only from the lowercase bold in rows 4–5 that `Devon`, `Mark`, and `Refiners` are the cast names while `tapes` and `episode` are lowercase working nouns.
Name the three cast nouns explicitly in `preamble.md:33-34` (`"write the cast names (Devon, Mark, Refiners) capitalized; working nouns (episode, tapes, brief, findings) stay lowercase"`).

### F10 — should-fix — `profile-contract.md:33-41`, `conventions/episodes.md:46-47`, and `conventions/episodes.md:75-79` — VERIFIED

> `Where briefs land (the episodes/ root is fixed by the convention;`
> `say what else the project expects in a brief — e.g. the acceptance`
> `checks it must list); which lane integrates and how (plain merge on`
> `the main branch, or a plain-lane commit that closes the episode); any`
> `project-specific preconditions a session must probe before building`
> `on the main checkout, each with its failure action (STOP and hand`
> `back).`
>
> `The brief is a **derived artifact**: the plan Devon approved, wrapped`
> `in frontmatter, committed as the branch's **first commit**.`
>
> `status lives in the brief: **draft** — planning paused for longer`
> `than a session, the brief committed so another lane can resume;`
> `**pending** — open; **merged** — closed by the integration.`

A consumer writing `profile.md` or a session running an episode cold from this law alone cannot answer three mechanical questions: (1) `profile-contract.md:35-41` omits `episodes/2026-10-28-law-rewrite/brief.md:44`'s requirement to specify *how the gate is run on the merge candidate* (and which lane can run the gate when some lanes lack browser/toolchain reach); (2) git forbids checking out the same episode branch in Mark's checkout and a Refiner worktree simultaneously (and Claude Code Refiners create `worktree-agent-<id>` branches per `reintegration.md:217`), yet the law never says how Refiner worktree commits fold into the episode branch; and (3) in a plain `git merge --no-ff` flow, the law does not state whether flipping `brief.md` to `status: merged` and moving the entry in `episodes/index.md` is the last commit on the episode branch before merging or part of the merge commit itself.
In `profile-contract.md:35-41`, add how/where the gate is run on the merge candidate; in `conventions/episodes.md`, add one sentence stating how Refiner worktree branches fold into the episode branch and which commit flips `status: merged` and `episodes/index.md`.

## Checked and found correct

- **Fidelity to `episodes/2026-10-28-law-rewrite/brief.md` and `reintegration.md`**:
  - All eight rules (`Rule 1` through `Rule 8`) in `constitution.md:36-100` match the brief's outline (`brief.md:56-77`), including the graduated `NOTES.md` candidates: `Rule 7` (no experiments in the shared working tree, absolute paths to session-private storage, no dependence on a prior `cd`) and `Self-assessment before hand-back` (`constitution.md:166-173`).
  - Precedence order (`live user instruction > this SPEC and the consumer's committed conventions > a brief`) is explicitly stated in `constitution.md:29-32`.
  - The resist-collapse rule (`constitution.md:127-147`), including its generality clause (`"binds any command sequence a session emits — its own interactive shell chains included"`), and the `"Refiners inherit"` rules (`constitution.md:149-164`) are carried over intact from `v0.3.1:constitution.md`.
  - `"Refuse by handing back, never silently"` (`constitution.md:185-192`) and `"Session memory hygiene"` (`constitution.md:194-212`, updated from `.handoff/` to the main branch and the episodes index) are carried over intact.
  - All five required sections of `profile-contract.md` (`Gate`, `Lanes`, `Episode mechanics`, `Reviewer`, `Implementation docs`) are present (`profile-contract.md:8-54`), and hygiene preconditions and the sanctioned flow are no longer mandatory top-level contract sections.
- **Lost-content trace against `v0.3.1` (`severed-era.md`)**:
  - `.handoff/` and the erase-after-use tape lifecycle (`v0.3.1:constitution.md` lines 48-68) are traced with mechanics, loss rationale, and revisit trigger in `severed-era.md:23-38`.
  - Old Rule 3 ("the outer sees the default branch only") is traced in `severed-era.md:39-46`.
  - Closed side-channels `C-1` through `C-11` are traced in `severed-era.md:48-71` (except the C-6 survival discrepancy noted in `F6`).
  - Draft anatomy (`PKG1..N`, verbatim anchors, package map, out-of-scope list, content hashes, anchor-time is verify-time) and all eight inner apply rules are traced in `severed-era.md:73-91`.
  - `"Why not just let the outer commit?"` and the old profile contract's `Hygiene preconditions` and `Sanctioned flow` sections are traced in `severed-era.md:93-110`.
- **Plain-English, conceit, and path-hygiene rules**:
  - Every cast name in `preamble.md`, `constitution.md`, `conventions/episodes.md`, and `profile-contract.md` is understandable without watching the show; `Devon`, `Mark`, `Refiners`, `Lumon`, and `Cold Harbor` are capitalized throughout, and plain working nouns (`episode`, `tapes`, `brief`, `findings`, `lane`, `boundary`, `gate`, `reviewer`, `plan`) are lowercase.
  - `git grep -niw wall` confirmed zero occurrences of `"wall"` across `preamble.md`, `constitution.md`, `conventions/episodes.md`, `profile-contract.md`, `conceit.md`, and `severed-era.md`.
  - `git grep -n 'Outie\|Innie'` confirmed zero occurrences of `Outie` or `Innie` in any `[spec]` source file.
  - Path-hygiene greps (`/(home|Users)/[A-Za-z0-9_.-]+/` and the user's login) confirmed zero user-specific paths across the repository.

## Files opened

### Files read (`read_file`) — repo-relative
- `preamble.md`, `constitution.md`, `conventions/episodes.md`, `profile-contract.md`, `reintegration.md`, `episodes/2026-10-28-law-rewrite/brief.md`, `severed-era.md`, `conceit.md`, `MANIFEST`, `episodes/index.md`, `NOTES.md`, `DESIGN.md`, `CLAUDE.md`, `conventions/git-commit-attribution.md`, `conventions/no-user-specific-paths.md`, `conventions/trace-notes-on-removal.md`, `conventions/learnings-register.md`, `learnings.md` (lines 1–660)

### Git and read-only shell commands run (`run_command`)
- `git show v0.3.1:preamble.md`; `git show v0.3.1:constitution.md`; `git show v0.3.1:profile-contract.md`; `git show v0.3.1:conceit.md`
- `git log --oneline v0.3.1..HEAD`; `git log -n 8 --oneline && git status -sb`; `git log -p -S "4,575"`
- `git diff v0.3.1 -- preamble.md constitution.md conventions/episodes.md profile-contract.md`
- `git diff -- preamble.md constitution.md conventions/episodes.md profile-contract.md episodes/index.md`
- word counts of the `[spec]` sources at `v0.3.1` and `HEAD` (`git show … | wc -w`, `wc -w …`)
- `git grep -niw wall`; `git grep -n 'Outie\|Innie'`; the two path-hygiene greps

---

# Mark's verification (Rule 6)

Every cited line was checked against the file by `grep -n` on the
quoted text (2026-10-28, commit `8a0c622`): **all ten citations
hold** — F1 brief:140 and reintegration.md:228; F2 brief:78 and
`first-parent` absent from the constitution; F3 episodes.md:37 and
:93; F4 episodes.md:68, constitution.md:182, profile-contract.md:47;
F5 constitution.md:171, episodes.md:65, index.md:14; F6
severed-era.md:56 and :67, the obligation absent from the
constitution, the v0.3.1 C-6 text at its line 89, NOTES.md:58; F7
episodes.md:101, constitution.md:162, reintegration.md:217; F8
episodes.md:47–48 (line-wrapped); F9 preamble.md:33; F10
profile-contract.md:35, brief:44, `fold` absent from the convention.
One qualification: the profile contract's Gate section already says
Mark runs the gate "on the exact merge candidate" (line 12); F10(1)
is about the *lane*, and holds for that.

Disposition: **F2–F10 fixed** in the commit carrying this tape (F7's
attribution to Claude Code; F10's three sentences; F6's clause
restored under Rule 2 with the auto-load re-read, and NOTES graduated
accordingly). **F1 applied at the episode's close**: the final word
count goes to `reintegration.md` and the rationale to the
implementer's `findings-self.md`.

Model line corrected per Devon (see frontmatter).
