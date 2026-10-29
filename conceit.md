# The Severance conceit

The workflow is named **Severance**, after the TV show, and its
successor keeps the name as homage: **Unsevered** is what the workflow
became, in the same repo, after the migration this record calls
**reintegration**. The name was earned, not borrowed: in the first
workflow the severance was real — two sessions, host and container,
with private memories architecturally invisible to each other, and a
legislated channel between them. In the second it is still real, but
it runs *across time*: every session ends and the next one wakes with
no memory of it, knowing only what was written in the repo. A
**conceit** is an extended metaphor sustained through a work; this
note tells the story once, so the law doesn't have to.

The central irony survives the migration: the show's severance *hides*
the two selves from each other; ours ends by **writing everything
down** — the sanctioned channel became the record itself.

## Why this project exists (the experiment)

This workflow is the process side of the user's **first attempt at
coding with LLMs** — an experiment. The first consumer project —
**Teppan**, a static-site generator by the company TEKii — was the
driver: a real problem solved with the new technology, and an
important deliverable in its own right, so the experiment had to
succeed on both counts. The work is intended for public presentation
(experiment / paper); the conceit is that publication's **hook** — it
draws readers honestly, because every mapping describes the real
architecture. What each step taught is recorded in the learnings
register (`learnings.md`, this RECORD); how the first workflow became
the second is `reintegration.md`.

## The cast — the story behind the table

The SPEC's preamble carries the working table; the mappings' stories:

- **Devon** (the user) holds the authorizing role because Devon is
  the only participant whose memory is continuous in real time — the
  unsevered ally who, in the show, carries the tapes across the
  threshold. The repo now shares the continuity job; Devon keeps the
  authority.
- **Mark** is the main session — not one session but the *lineage*:
  one worker whose memory is severed at every session end and restored
  from the record at every session start. A session is one of Mark's
  days. The name is model-neutral: a Claude session and a Gemini
  session reading the same record are the same Mark. (Pleasingly, the
  show's Mark leads the Macrodata Refinement floor — a coincidence,
  never a rule.)
- **Refiners** are the agents a session spawns — provisioned to one
  piece of work each, judged by a gate, torn down — the severed floor's
  workers. They are not Mark: they are never restored; their findings
  are.
- **The camcorder / tapes**: in the show the two selves exchange
  recorded messages via a camcorder carried across the threshold by
  the unsevered ally — single author per tape, a reply is a new tape.
  That is still the shape of a **brief** and its **findings**. What
  changed is the ending: the show's recipient erases the tape after
  viewing, and so did the first workflow; Unsevered **keeps every
  tape**, on the branch, in the record. One line of `.gitignore` is
  the whole mechanical difference — and the whole point.
- **Episodes**: the unit of work was named on plain-English merits —
  a brief, a branch, a merge is an *episode of work* — and only then
  found to be the show's own vocabulary (the first workflow's source
  incident, "Cold Harbor", is an episode title). An `episodes/` folder
  reads as an episode guide; the first-parent log reads as the season.
  No numbering, seasons or arcs: date and topic are the identity.
- **Reintegration**: in the show, the procedure that undoes severance —
  attempted, partial, risky, unfinished (one character dies of it; the
  protagonist stays split). Here it names the **migration** from the
  first workflow to the second, once, and nothing inside the workflow.
  It was partial in the honest sense too: only what the first workflow
  wrote down crossed over.

Show-fidelity deltas, owned rather than hidden: the split is temporal
here, not spatial — the show never severs a person across days; the
channel is constituted by the authority itself, not contraband; and
the show's reintegration fails where ours is a sanctioned ritual.

## Retired cast

**Outie** and **Innie** named the host and container sessions of the
first workflow; **MDR** named its agent fleet. The host/container split
is gone — each lane now has its own clone — so the names retired as
working vocabulary and live on in the register and in `severed-era.md`,
the trace of the mechanics they ran. Re-mapping Innie to the
implementer (or to a forked agent, which literally is an innie of its
parent) was considered and rejected: true, but redundant with
Refiners, and an overstretch.

## Lanes (declaration-only)

Sessions run in **lanes** — a cloud VM, a container, a sandboxed host,
another harness. In the conceit a lane is a severed floor of its own;
everywhere else the docs say **VM**, **container**, **sandbox**, and
**boundary** for the abstraction — documentation must be understood
first and enjoyed second.

## Rules of the conceit

- **Casing:** capitalized cast names in docs and agent-directed text;
  lowercase accepted only from Devon's typing, never written back.
  "Unsevered" capitalized when it names the workflow, lowercase as the
  plain adjective.
- **Two tiers:** *working vocabulary* (the cast, tapes, episodes —
  names that aid precision because they name things that had no short
  name) vs *declaration-only* (lanes — where exact technical terms
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
`cold_harbor`.
