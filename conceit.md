# The Severance conceit

The workflow is named **Severance**, after the TV show. The name is
earned, not just borrowed: the severance is real — the sessions' private
memories are architecturally invisible to each other, and each session
is dormant (experiencing nothing) while the other drives the shared
repo. A **conceit** is an extended metaphor sustained through a work;
this note tells the story once, so the law doesn't have to.

The central irony, and the reason the name fits this project better than
the show it quotes: Lumon's severance *hides* the two selves from each
other, while ours **legislates an auditable channel between them** — the
constitution took an illicit channel and legalized it.

## Why this project exists (the experiment)

This workflow is the process side of the user's **first attempt at
coding with LLMs** (Claude, via Claude Code) — an experiment. The first
consumer project — **Teppan**, a static-site generator by the company
TEKii — was the driver: a real problem solved with the new technology,
and an important deliverable in its own right, so the experiment had to
succeed on both counts. The work is intended for public presentation
(experiment / paper); the Severance conceit is that publication's
**hook** — it draws readers honestly, because every mapping describes
the real architecture. What each step taught is recorded in the
learnings register (`learnings.md`, this RECORD).

## The cast — the story behind the table

The SPEC's preamble carries the working table; the mappings' stories:

- **Devon** (the user) holds the mediator role because Devon is the only
  **unsevered** participant — the one memory continuous on both sides of
  the boundary; in the show, the tapes exchange is handled by the
  unsevered ally.
- **Outie / Innie** map to the host and container sessions; the shared
  repo is the *shared body* — sessions are alternating occupants, and a
  dormant session "loses the time" exactly as the show's selves do.
- **Refiners / MDR**: ephemeral agents, provisioned to one file-of-work
  each, judged by a gate, torn down — the severed floor's workers.
- **The camcorder / tapes**: the show's two selves exchange recorded
  messages via a camcorder carried across a severed threshold by the
  unsevered ally — single author per tape, a reply is a new tape, the
  consumer disposes of it after viewing. That is the `.handoff/`
  lifecycle, mechanism for mechanism. "Devon passes the camcorder" *is*
  the activation — one pass, one authorized leg.

Show-fidelity deltas, owned rather than hidden: in the show the channel
is contraband, ours is constituted by the authority itself; the show's
camcorder crosses a threshold one body walks through, ours passes
between two concurrent sessions; and the Outie's unawareness during the
Innie's turns is the default state of dormant sessions, not an enforced
rule.

## The environments (declaration-only — stated here, then retired)

In this conceit, the container is *the severed floor* and the host is
*the outside*. Everywhere else the docs say **container** and **host** —
documentation must be understood first and enjoyed second. (Names for
the worktrees and cloud environments were considered and parked.)

## Rules of the conceit

- **Casing:** capitalized cast names in docs and agent-directed text;
  lowercase accepted only from Devon's typing, never written back.
- **Two tiers:** *working vocabulary* (the cast — names that aid
  precision because they name things that had no short name) vs
  *declaration-only* (the environments — where exact technical terms
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
`cold_harbor`. (Pleasingly, "Cold Harbor" is the show's flagship project
— and the title of the episode in which the tapes are exchanged.)
