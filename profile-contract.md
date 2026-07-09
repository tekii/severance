# The profile contract

Every consumer project MUST provide a **`profile.md`** vendored beside
this SPEC, answering the questions this law deliberately leaves open.
An adoption without a complete profile is visibly incomplete. Required
sections:

## Gate

The command(s) that every integration must pass, with explicit pass
criteria (e.g. Cold Harbor: `make test` — N assertions, 0 FAIL). The
constitution's sanctioned flow refuses to merge anything that has not
passed the gate.

## Hygiene preconditions

Checks that MUST hold before build/test commands run on the main
checkout, each with its failure action (STOP and hand back). (E.g. Cold
Harbor: a mount probe proving the build volume is present, so a
mis-mounted checkout cannot poison paths.)

## Sanctioned flow

The exact provision → edit → gate → integrate → teardown mechanism for
landing repo-content, and which lane may run it (typically
container-gated tooling that fails closed outside the severed floor —
this is what makes "the outer cannot commit" a mechanism, not a
politeness).

## Implementation docs

Where the consumer's own machinery documentation lives (container
setup, fleet runbooks, environment notes). This law never links
consumer files; the profile is the indirection point.
