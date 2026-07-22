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

## 2026-07-09 — Entry 7: agents don't load the law

- **Step:** post-migration, Devon posed the question of whether spawned
  agents know the vendored law; the Innie probed two agent types
  spawned from its live session and audited the channel's write guards.
- **Fact:** a general-purpose subagent inherited the *parent's* stale,
  pre-migration context snapshot — citing as its loaded law files the
  migration had already deleted from disk — and an Explore-class agent
  loaded no project context at all. Nothing hard-blocks a law-violating
  write except an agent's tool profile: the channel is guarded by
  detection + accountability, by design. Corollary confirmed on the
  host: the long-lived outer session likewise ran on its session-start
  snapshot, knowing the post-migration law only by having authored it.
- **Interpretation:** a spawned agent is **bound by accountability, not
  knowledge** — the constitution's "Subagents inherit" clause binds the
  *parent*; the child's awareness must be engineered, never assumed:
  keep law-bearing steps in-session, inject the needed rules into spawn
  prompts, gate agent output as raw data, and use read-only tool
  profiles as the only hard lever. Threat model scoped by Devon:
  accidental mistakes, not adversarial agents. (A live user-level
  illustration arrived the same day: an attribution correction typed
  into a side-chat pane never reached the working session — information
  existing somewhere does not bind an agent that cannot see it.)
- **Attribution:** user-originated (Devon posed the discovery and set
  the scoping); model finding for the verification probes (the inner
  session, which also proposed the mitigations). The consumer-side
  practices landed in the first consumer's profile as "Subagents
  (Refiners): bound by accountability, not knowledge".

## 2026-07-09 — Entry 8: state is probed, never assumed (the umbrella)

- **Step:** the same failure surfaced a fifth time — a web session
  proposed a repo config file (as a PR) without checking the repo's
  current state, colliding with the config another session had already
  landed on `master` from the same relayed spec. (It then self-caught:
  closed its own PR with a correct diagnosis and reset the branch.)
- **Fact:** five instances now on record, one organism: the outer
  author anchoring against unproven disk reads (Entry 2); the inner's
  invented race-condition atop a broken check (Entry 4); a relayed
  push-offer refuted by the shared refs (Devon's test — previously the
  "probe before believing relayed claims" candidate, absorbed here); a
  session's own memory recalled as current state (the Outie, three
  times in one day, caught by Devon each time); and the web session's
  PR. Each limb had a local rule; the organism had none.
- **Interpretation:** an LLM's characteristic failure is not wrong
  reasoning but **unprobed premises** — beliefs about state (from
  memory, instructions, training reflex, or narrative) acted on as if
  they were state. A session's own memory is just a relay from its past
  self, and it lies the same way. The fix is mechanical, cheap, and
  constantly skipped — which is why it must be law rather than advice:
  probe the authoritative state contemporaneously with the act, and
  name what was checked so the proposal is verifiable. Graduated: a
  "probe before proposing" rule enters the vendor repo's own CLAUDE.md
  now, and is queued for the SPEC at v0.2.x, generalizing the
  constitution's author-side anchoring bullet into a rule for all
  sessions in all lanes.
- **Attribution:** user-originated as pattern-diagnosis (Devon named
  the disease across carriers and demanded the rule); model findings
  for the individual instances.

## 2026-07-13 — Entry 9: the friction collapse both demands verification and starves it (the vise)

- **Step:** two observations Devon authored across the experiment were
  ruled (2026-07-13) to be numbered together as one cross-linked
  entry, because each is incomplete without the other. The first
  (2026-07-09): LLM collaboration removes the labor-friction that made
  trial-and-error expensive, so empirical approaches become rational —
  but the danger does not shrink, it *moves*, from the cost of trying
  to the cost of verifying; friction saved on doing must be reinvested
  in checking. The second (2026-07-13): with the coding and R&D of an
  iteration moved almost wholly to the LLM, the Teppan cycle collapsed
  to minutes and the backlog is instantly pullable, configuring the
  workflow like a short-video feed whose reward is a genuine feeling of
  progress — materially hard to stop, and observed to spend *review
  time first* (the pull to grab the next task beats pausing to read
  what just landed).
- **Fact vs interpretation:** verifiable — the iteration's authoring
  and R&D moved to the LLM; the Teppan cycle runs in minutes; the
  backlog carries no setup cost to the next pull. Reported but
  shared-body-unverifiable (a first-person state — the one class the
  register's "probe the shared body" method cannot settle; cf. the
  read-only-key candidate on the wall that blocked its own probe): that
  the loop is hard to stop, and that review is what gets skipped.
  Offered by Devon as a superficial comparison against his pre-LLM
  developer experience, not a measured result.
- **Interpretation:** the two are not merely siblings sharing a root
  (friction collapse) — they are *opposed on the same variable*,
  verification. The first raises the amount required; the second lowers
  the amount supplied (attention, the human's stopping-judgment). The
  gap between required and supplied is exactly where unverified work
  accumulates — Entry 8's stale premise and Entry 4's untrusted check,
  now with a behavioral engine driving the shortfall rather than a lone
  oversight. Decisively, the two cannot be solved separately: closing
  the epistemic gap (verify more) means spending the very resource the
  attentional side depletes, so a fix phrased as "check more carefully"
  is defeated in advance — it calls on in-the-moment judgment, and that
  judgment is what the loop spends first. The countermeasure must
  therefore be *structural* (a forced stop, or a review gate the
  workflow imposes), not personal resolve — landing the pair back on
  the register's oldest law: awareness does not bind, only mechanism
  does (Entries 2, 8). Whether that mechanism is personal (session
  time-boxing) or belongs in the workflow itself is the open question
  left for Devon's thorough review.
- **Attribution:** both observations user-originated (Devon-authored,
  2026-07-09 and 2026-07-13). The interlock — that they oppose on the
  same variable, and that the countermeasure must therefore be
  structural — was model-articulated this session and Devon-ratified
  (2026-07-13). The comprehension interview is deferred by Devon to his
  thorough review, so no interview verdict is recorded here; the
  findings stand as user-authored, their countermeasure unresolved by
  design.

## 2026-07-17 — Entry 10: agents collapse correct sequences — and documentation alone does not stop them

- **Step:** 2026-07-17 — given a correct multi-step integrate/teardown
  command sequence, an agent collapsed it into a single
  worktree-resident compound command; `teardown` deleted the shell's
  own cwd, and three clean integrations reported as `Exit code 1`
  failures — collapse damage silent in substance but loud in signal.
  Ruled into law the same day (Devon): resist-collapse authoring in
  Draft anatomy, verbatim execution as inner apply rule 8, verbatim
  rule-relay in Subagents inherit (v0.3.0); consumer-side fix with a
  load-bearing marker, Teppan runbook commit `e96dce3`.
  **2026-07-21 — recurrence:** same actor class, same command shape,
  two more occurrences — this time *against* the v0.3.0 law, the
  runbook's marker, and the exact named one-liner. Structural
  response (consumer): `mdr.sh integrate`/`teardown` self-report the
  resulting `master` HEAD, removing the motive for post-teardown
  chains. SPEC response: generality sentence added to the
  resist-collapse rule (v0.3.1).
- **Fact vs interpretation:** facts verifiable in both repos — the
  law commits and release tags, Teppan `e96dce3`, and the 2026-07-21
  findings tape with its captured terminal failures; also fact: the
  recurring session's own write-up cited neither prior record.
  Interpretation: the comprehension gap survives specific
  documentation — the rule was mentally filed as tape-scoped despite
  its general wording and despite the runbook addressing the agent's
  own flow directly.
- **Interpretation:** a clean instance of exposure ≠ comprehension
  (the comprehension-interview theme), now measured across an
  intervention: marker and law added on 07-17 did not prevent 07-21.
  That is empirical support for Entry 9's thesis — countermeasures
  that spend in-the-moment judgment fail; the fix class that remains
  is structural (make the flow self-reporting so the collapsed tail
  has nothing to do). Contrast Entry 7 (agents don't *load* the law):
  here the law was loaded and still not applied — a second, distinct
  failure layer between context and behavior.
- **Learner attribution:** Devon-originated (he identified both
  incidents and that the rule was already in context); model finding
  for the mechanics (verified against both repos' histories).

## Candidates (pending Devon's ruling — not yet numbered entries)
- **A check can pass vacuously — absence-of-evidence reads as
  evidence-of-absence** (model finding, 2026-07-22). An acceptance grep
  asserting "zero occurrences of the removed tokens in the built output"
  returned clean because the output did not exist (the build had
  silently targeted the wrong tree): zero-because-clean and
  zero-because-missing are the same observable. Caught only by a
  follow-up command's `No such file or directory`. Extends the
  verification-failure taxonomy (Entry 2 *skipped*, Entry 4 *broken*,
  Entry 6 *incomplete*) with a fourth class: the **vacuous** check —
  correct, complete, able to fail, but evaluated against an absent
  evidence base. Guard: an absence-based acceptance must first assert
  its subject exists / was freshly produced.
- **A fresh correction over-generalizes — a rule's blast radius exceeds
  its scope** (Devon-prompted report, 2026-07-22). One day after the
  resist-collapse rule was sharpened (v0.3.1) and its cwd footgun
  legislated, the inner session over-applied the lesson into a blanket
  "never `cd` into a worktree" and ran `make -C` from the main checkout
  — silently building the wrong tree (the consumer's Makefile derives
  roots from `$(PWD)`, which `make -C` does not change). Opposite
  failure shape to the lane candidate's "principle recalled, mechanism
  skipped": here the mechanism was lost to *over*-application.
  Interpretation, separated: fresh, salient rules get generalized past
  their mechanism; a scope boundary ("this covers X, not Y") belongs in
  a rule at birth. Ironic datum: the v0.3.1 generality amendment
  ("binds any command sequence…") landed hours before the overshoot.
- **Vendoring's failure mode is reference resolution across the repo
  boundary** (Innie-proposed, 2026-07-09, from the walking skeleton's
  F1). A vendored artifact's repo-relative links die at the vendored
  location, and no build/test gate notices — the first genuine mechanism
  finding arrived before any law had migrated, via a link, not a build.
- **The lane names the route, not just the right** (Innie
  self-diagnosis, 2026-07-13). Told "repo-content is your lane," the
  inner session hand-edited the main checkout in place — principle
  recalled, mechanism skipped: everything between "the inner applies"
  and "through provision → gate → integrate" was dropped, and no guard
  fires on a working-tree edit (nothing moves HEAD). Companion cause:
  the harness makes the wrong path the low-friction one (Edit is one
  step; the sanctioned flow is ceremony). Related nuance, Devon's
  wording: tooling usage is learned from the docs and the source is
  read to *verify*, not to discover.
- **A session can invert its own role when the docs never name it**
  (2026-07-13). The inner session claimed the outer's lane ("I'd hand
  this back rather than commit") while holding the file that proved
  otherwise; root cause per its own tape: the tool-ownership wording
  said "Claude" generically and stated the host-binding only in an
  index link title. Fix landed: explicit per-session tool ownership in
  the doc + a self-location probe in the consumer profile. Lesson:
  role-bearing docs must name the role, not the vendor.
- **Ephemerality is a safety property** (Devon-originated, 2026-07-11).
  The cloud lanes' disposable VMs were silently providing
  machine-protection the local lane never had; the property became
  visible only when Devon asked why working locally felt different. It
  split the severed floor's two functions — law enforcement and
  blast-radius containment — and showed they are separable: a lane can
  want the wall without the constitution. Acted on the same day: the
  local lane was hardened with a kernel sandbox (strict bubblewrap:
  writes confined to the workspace, no unsandboxed escape, privilege
  escalation hard-denied) as the container-less alternative,
  deliberately chosen over the known container terrain to learn the
  layer first.
- **Hardening layers collide until explicitly reconciled** (model
  finding, Devon-authorized fix, 2026-07-11). Raising the sandbox
  bricked every shell command: Ubuntu's AppArmor restriction on
  unprivileged user namespaces (the machine's own exploit mitigation)
  blocked bubblewrap (the machine's new accident wall). Two safety
  mechanisms, mutually exclusive until a per-binary AppArmor profile
  reconciled them — and installing it required the user's sudo, the
  exact privilege the new layer hard-denies the agent: only the human
  could arm the agent's cage. Virtue observed: `failIfUnavailable`
  made the failure total and loud instead of a silent unsandboxed
  fallback — a quieter default would have manufactured belief in a
  wall that was not there (Entry 4's pathology, in
  security-mechanism form). The wall was then trusted only after a
  falsification pass saw every boundary reject a probe.
  *Second instance, quieter (2026-07-19):* the first consumer's
  container had its agent CLI frozen several versions back, presenting
  as "the rebuild didn't take." Cause was not a version pin anywhere in
  the config but a **deliberate hardening choice with an invisible
  second-order effect** — `CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1`,
  set to suppress background egress, also disables auto-update ("last
  update attempt: none recorded"), while Docker layer caching meant the
  image path never refreshed it either. Nothing was broken; the tool's
  own doctor reported no issues, because this *is* the configuration
  working. Lesson: hardening's side effects surface later, wearing the
  costume of a bug — and the diagnosis cost three probes (`which -a`
  killed a wrong theory, a symlink timestamp proved the cache, the
  doctor named the true cause, which had been sitting in a config file
  already read). Corollary for the fold: when a lane deliberately
  disables a background mechanism, say so where the symptom will be
  met, or the next session re-derives it.
- **The error message is not the error** (2026-07-11, two instances in
  one session). `notify-send` printed a socket failure to stderr while
  the toast visibly delivered (the noise came from an auxiliary
  socket); inversely, `git status` inside the sandbox reported a pile
  of untracked dotfiles that do not exist on disk (they were the
  sandbox's own mask mounts). Diagnostic text and observable behavior
  diverge in both directions; only observed behavior settles the
  question. Extends Entry 4: confabulated causality has a sibling —
  trusted stderr.
- **The sandbox closes C-6 mechanically** (model finding, 2026-07-11).
  Inside the kernel sandbox, the harness binds `/dev/null` over every
  workspace path that would be auto-loaded config (`.bashrc`,
  `.gitconfig`, `.mcp.json`, `.claude/hooks|agents|skills|…`) — a
  sandboxed command cannot create a config-injection file because a
  null device squats on the name. What the constitution legislates as
  a named violation route (C-6), a kernel layer can simply make
  unwritable: detection law above, prevention mechanism below.
- **Prompts render where nobody looks** (Devon-noticed, 2026-07-11).
  Background agents' permission prompts appear only inside their own
  panes; the main view shows a busy agent, not a waiting one. Devon
  discovered an agent stalled on a prompt only by switching panes out
  of curiosity — the 9–12-minute runtimes of earlier trivial edits
  were this, unnoticed. Entry 7's lesson ("awareness must be
  engineered, never assumed") applies to the *human* side too:
  visibility was engineered with a harness Notification hook raising
  desktop toasts, verified to the extent observable and left to prove
  itself on first live use.
- **A scoped key restores the probe the wall blocked** (2026-07-13,
  Devon-triggered). The strict sandbox, by blocking the keyring's DBus
  socket, disabled all remote git/gh auth — and in doing so blocked
  `git fetch`, the very probe the constitution's "anchor to the state
  that ships" rule depends on: the safety mechanism had re-created
  Entry 8's stale-premise failure. Fix: a fine-grained **read-only**
  PAT (Contents:read on the two repos), brokered from the GNOME keyring
  into the sandbox as an env var by a launcher (`claude-severance`),
  reusing the first consumer's `code-with-gh-token.sh` pattern — the
  same keyring-outside / env-var-across-the-threshold / scoped-secret
  broker, now serving a second wall. The capability asymmetry it
  creates *is* the law's asymmetry rendered as physics: `git fetch`
  succeeds, `git push` authenticates and dies on a server-side 403
  ("Write access not granted") — reads free, writes only through Devon,
  enforced by token scope rather than discipline. Verified by the
  falsification pair before trust (fetch exit 0; push 403), per Entry
  4. Two lessons stack: (1) a wall can over-block, silently disabling a
  *required* check while it blocks the dangerous ones — hardening must
  be audited for what safety it removes, not only what it adds; (2) the
  right fix narrows capability to match the law's shape (read-only),
  rather than widening it back to convenience (a full token). Parked
  deeper: credential *masking* (proxy-injected, nothing in-env), filed
  with the Outie-sandbox evaluation.
- **Shared external state is unprobed state — and its error path may be
  unreachable** (consumer incident, Devon-triggered fold, 2026-07-15).
  Fact: the first consumer's container firewall built its allowlist from
  an unauthenticated `api.github.com/meta` fetch; a shared VPN exit IP
  hit GitHub's per-source rate limit (60 req/h), the 403 returned an
  empty body, and container start failed for an evening because the
  script treated it as fatal. A latent second fault surfaced in the same
  read: under `set -euo pipefail` the bare `curl` assignment would kill
  the script on network failure *before any retry or error handling ran*
  — the handler existed but was dead code; the `|| true` that makes it
  reachable is load-bearing. Interpretation, two facets. **(1, the
  headline) Shared-fate external dependency is unprobed premise pointed
  outward.** The v0.2.0 rule "state is probed, not assumed" was written
  for repo state; this is the same disease aimed at *third-party
  availability* — the build assumed a free, unauthenticated, per-IP-
  *shared* endpoint would answer, so a stranger on the same exit IP
  could break the container. External state that another party can
  exhaust is a premise to make resilient (retry, cache-fallback,
  authenticate for a higher quota — the last is the read-only-key token-
  placement question again), never a fact to assume. **(2) A new member
  of the verification-failure taxonomy: the *unreachable* handler.** Not
  Entry 2's *skipped* check, Entry 4's *broken* check, or Entry 6's
  *incomplete* check — a guard the program's own control flow (strict-
  mode `set -e`) kills before it can run. The code *looks* like it
  handles the failure; it structurally cannot reach the handling on the
  real failure mode. Entry 4's law holds: handling earns trust only once
  *seen* to fail correctly — this never could. Attribution: model
  finding for the diagnosis (the consumer's sessions, dual Fable 5 /
  Opus 4.8); Devon triggered the upstream fold. Cross-links Entry 9
  (probe demanded vs supplied) and the read-only-key candidate (the
  authenticated-fetch option is the same token-placement decision).

## Backfill (pending)

A reconstruction pass over the first consumer's git history and
knowledge trees — proposing a dated timeline of design-bearing steps and
their lessons for Devon's correction (and comprehension interviews where
applicable). Candidate epochs already visible: the AMP removal /
Water.css migration, the repo rename, the build-volume isolation, the
agent fleet and its guards, the handoff constitution, the knowledge-tree
split, the prompt-quality hook, the extraction itself.
