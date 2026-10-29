# The severed era — trace note for the retired machinery

**Trace note** (per the trace-notes-on-removal convention): the
mechanics of what the law no longer contains, concrete enough to
resurrect, with why each lost and what would justify revisiting it.
The full text of the retired law is in the vendor repo's history at
tag `v0.3.1` (`constitution.md`, `preamble.md`, `profile-contract.md`).
Retired 2026-10-28 by the reintegration (`reintegration.md`).

## What was retired, and why

The first workflow split one repo's work between an **outer (host)**
session and an **inner (container)** session sharing a bind-mounted
working tree and `.git`. Every retired mechanism below existed because
of that one topology fact. The migration removed the fact — each lane
now has its own clone — and with it the hazards each mechanism
guarded. In the words of the first consumer's own note, the hooks were
"the fallback for keeping the bind-mount"; the own-clone option was
the stronger alternative it named. **The loss is conditional on every
lane keeping its own clone.** Reintroduce a shared working tree
between two sessions and all of this comes back.

### The channel: `.handoff/` and the tape lifecycle

An untracked, gitignored directory on the shared mount, the only
medium through which one session could address the other. Tapes:
`plan-<topic>.md` / `draft-<topic>.md` (outer → inner) and
`findings-<topic>.md` (inner → outer); one topic per file; single
writer, a reply is a new tape; a provenance header with session,
model, date and a `Trigger:` line; **the consumer deleted the tape
after use**, so an empty `.handoff/` meant "nothing pending" — a
checkable invariant probed by a session-start ritual (`ls -A
.handoff/`, hidden-file flags mandatory). *Why it lost:* the relay
became the record — tapes are now committed on the episode branch
(episodes convention), the single-writer and `trigger` rules intact,
the deletion step inverted. *Revisit if:* a consumer ever needs a
cross-session message that must **not** enter history.

### Rule 3 — the outer sees the default branch only

The outer's view of repo content was the authoritative default
branch; un-integrated refs were invisible to it by rule (the shared
object store made the read possible; the rule made the violation
nameable). *Why it lost:* no session shares another's object store;
Mark reads its own branches by design. *Revisit if:* two sessions
share a `.git` again.

### Closed side-channels C-1 … C-11

The concrete routes Rule 2's "anywhere else" named, each with a
testable violation criterion: C-1 names as messages; C-2 commit
metadata beyond the message; C-3 rare git message stores (`git
notes`, tag messages, stash messages, reflog); C-4 shared
`.git/config` and `.git/hooks` — highest severity, a hook one side
installs is code the other executes; C-5 scratch in the shared tree
outside `.handoff/`; C-6 config the other session auto-loads (prompt
injection by editing the harness's includes; changes to auto-loaded
config always named to the user); C-7 the shared object store as a
read channel; C-8 runtime side-channels into the live container
(exec, env, mount names — any exec *write* a violation); C-9
steganography (whitespace, zero-width characters, mtime, diff shape);
C-10 remote surfaces (PRs, issues, CI logs — deferred); C-11 channels
that arise by accident (a shared build volume once broadcast
who-built-last via baked paths). *Why they lost:* C-4, C-5, C-7, C-8,
C-11 presuppose the shared mount; C-1, C-2, C-3, C-9 collapsed into
the rewritten Rule 2's deletion test and its one-line ban on anything
invisible in a rendered diff; C-6 survives in spirit as the
"Refiners inherit" caution and the auto-load ritual; C-10 is still
deferred. *Revisit if:* a channel is found that the deletion test
does not catch — the list was built by naming real routes, and the
practice of naming routes is the part worth keeping.

### Draft anatomy and the inner apply rules

The outer could not land content it authored, so a draft carried
**verbatim anchors and exact replacement text** per package
(`PKG1..N`), a package map, an out-of-scope list, content hashes when
the inner could not see a source repo, and the rule "prove the tree
authoritative before anchoring — anchor-time is verify-time". The
inner applied under eight rules: re-read the tape at apply time,
re-verify every anchor (watch line-wrapping), verify checkable claims
and keep "unverified" labels, run the profile's hygiene preconditions
or STOP, apply via the sanctioned flow, dual `Assisted-By` lines
(drafting and applying model), push only on the user's ask, execute
prescribed sequences verbatim. *Why it lost:* the author can now land
its own work; briefs state requirements and the implementer chooses
the how; the apply rules' survivors moved into the constitution —
resist-collapse whole, labels kept, Rule 4 (push), Rule 6 (evidence),
self-assessment, refusal by hand-back. *Revisit if:* a lane appears
whose session may author but not write — the anatomy is the
ready-made answer.

### "Why not just let the outer commit?"

The outer lacked the consumer's rails: the sanctioned flow was
container-gated and the accidental-HEAD-move guards failed open on the
host. *Why it lost:* the rails guarded the shared HEAD; there is no
shared HEAD. Rule 5 (one Mark per checkout) is the surviving
principle, now about concurrent sessions rather than lanes.

### The profile's hygiene preconditions and sanctioned flow

Required sections of the first profile contract: a mount probe before
any build on the main checkout (the baked-root trap of a shared build
tree), and a provision → edit → gate → integrate → teardown fleet
mechanism, container-gated so it failed closed on the host. *Why they
lost:* the shared build tree is gone with the shared mount; native
worktree Refiners replaced the fleet launcher. Preconditions survive
as an optional item under "Episode mechanics". *Revisit if:* a build
bakes absolute paths into a tree two lanes can both reach.

## What was kept, verbatim or nearly

Rule 1's trigger test; Rule 2's deletion test; "state is probed, not
assumed"; the resist-collapse rule including its generality amendment;
"Refiners inherit"; refusal by hand-back; session memory hygiene; the
attribution, path-hygiene, trace-note and learnings-register
conventions; the cast rules of the conceit.
