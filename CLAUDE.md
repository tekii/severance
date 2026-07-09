# tekii/severance — the Severance workflow's home repo

This repo runs a **plain single-session lane** (mostly Claude Code web):
no container, no Innie, no severed counterpart here (DESIGN.md,
constraint 2). Safety is **boundaries, not severance**: commit or tag
only when the user prompts it; never push without an explicit ask.

## Sources vs artifacts (the release discipline)

- The small `*.md` **source files are the truth**. `SEVERANCE.md` and
  `RECORD.md` are **built** from them per `MANIFEST` by `make release`
  — **never hand-edit the artifacts.**
- Artifacts are rebuilt and committed **only in release commits** (the
  tagged commits): edit sources → set `VERSION` → `make release` →
  commit `release vX.Y.Z: …` → `git tag -a vX.Y.Z`.
- `make check` proves the committed artifacts equal a fresh rebuild.
  It MUST pass at every release commit. Between releases, source-only
  commits may leave it reporting DRIFT (sources ahead of artifacts —
  expected mid-cycle; say so in the commit message).

## Probe before proposing

Before authoring or proposing any change, probe the current
authoritative state: `git status -sb` + `git log` (fresh — not your
session-start snapshot), read the actual target files, and check
in-flight work (`gh pr list`, pending artifacts). Memory, instructions,
and snapshots are *hypotheses about* state — the probe is the only
source of "is". Name what you checked, so the proposal is verifiable.
(Register Entry 8; a web session once PR'd a file this repo already
had.)

## Before any commit

- Run `make check`; a failure must be either fixed or the known
  mid-cycle DRIFT, never a hand-edited artifact.
- Path hygiene (conventions/no-user-specific-paths.md) — both empty:
  `git grep -iE '/(home|Users)/[A-Za-z0-9_.-]+/'` and
  `git grep -i '<your-login>'`.
- Attribution (conventions/git-commit-attribution.md): AI mentions use
  `Assisted-By:` — **never `Co-Authored-By:`**; some harness defaults
  append it automatically — strip it.

## Dependencies

GNU Make + POSIX shell only. Do not add dependencies.

## The law here is cargo, not law

`constitution.md` and `conventions/` are **sources** of the law that
binds *consumer* projects' sessions (tapes, `.handoff/`, Outie/Innie
lanes, the consumer's test gate). None of that machinery exists in
this repo: do not look for `.handoff/`, do not treat yourself as an
Outie or Innie, do not expect tapes to edit these files — here they
are text you maintain. ("The gate" here means `make check`, not a
consumer's test suite; this repo is the vendor, so it has no
`profile.md`.) Rules this repo **does** self-apply: attribution and
path hygiene (above), the learnings-register discipline (the register
lives here), trace-notes thinking for design-bearing removals (via
NOTES.md/DESIGN.md), and the conceit's anti-overstretch + casing rules
in all prose.

**No Devon here, no Outie either.** The cast names belong to the
consumer workflow's story; in this repo the user is simply the user
and a session is simply a session. `Assisted-By:` lines name the
**model**, never a cast role — write
`Assisted-By: Claude (claude-<model-id>)`. (Historical commits signed
"(Outie, …)" date from the extraction period, when the first
consumer's outer session doubled as this repo's maintainer — an
artifact of that period, not a pattern to follow.)

## Orientation

[DESIGN.md](DESIGN.md) — packaging & release design (read first).
[conceit.md](conceit.md) — the naming metaphor. [constitution.md](constitution.md)
+ [conventions/](conventions/) — the binding law's sources.
[profile-contract.md](profile-contract.md) — what every consumer answers.
[learnings.md](learnings.md) — the experiment's register. [NOTES.md](NOTES.md)
— open items. Cast: **Devon** = the user, **Outie** = outer session,
**Innie** = container session, **Refiners** = spawned agents (these name
the *consumer* workflow's roles — this repo itself runs the plain lane).
