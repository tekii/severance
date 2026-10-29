#!/bin/sh
# lint-frontmatter.sh — refuse YAML frontmatter that a strict parser would
# reject (or silently misread), using POSIX awk only: a YAML parser is not
# a dependency this repo takes (DESIGN.md, constraint 3). Run by build.sh
# on every artifact it writes and by `make check` on every source tape.
#
# Usage: sh lint-frontmatter.sh FILE...   (a file not opening with '---'
# has no frontmatter and passes). Checks, per `key: value` line:
#   - a double-quoted value spans the whole line, inner quotes escaped;
#   - a flow sequence `[...]` closes on the line;
#   - a plain value carries no ": " / trailing ":" (nested mapping), no
#     " #" (comment), and no leading YAML indicator (quote, &, *, !, |,
#     >, %, @, `, {, [, "- ", "? ").
# Anything else that YAML permits is not vetted here: when in doubt,
# double-quote the whole value.
set -u
status=0
for f in "$@"; do
    awk -v f="$f" -v sq="'" '
        function bad(m) { printf "%s:%d: %s\n", f, NR, m > "/dev/stderr"; st = 1 }
        NR == 1 { if ($0 != "---") exit 0; next }
        /^---$/ { exit 0 }
        {
            if ($0 !~ /^[A-Za-z0-9_-]+: ./) { bad("not a \"key: value\" line"); next }
            v = $0; sub(/^[A-Za-z0-9_-]+: /, "", v)
            c = substr(v, 1, 1)
            if (c == "\"") {
                body = substr(v, 2)
                if (length(body) == 0 || body !~ /"$/) { bad("double-quoted value must end with the closing quote"); next }
                body = substr(body, 1, length(body) - 1)
                gsub(/\\\\/, "", body); gsub(/\\"/, "", body)
                if (index(body, "\"")) bad("unescaped \" inside a double-quoted value (write \\\")")
                next
            }
            if (c == "[") { if (v !~ /\]$/) bad("flow sequence must close on the line"); next }
            if (index(v, ": ") || v ~ /:$/) { bad("unquoted value contains \": \" (YAML reads a nested mapping) — double-quote the whole value"); next }
            if (index(v, " #")) { bad("unquoted value contains \" #\" (YAML reads a comment) — double-quote the whole value"); next }
            if (c == sq || c ~ /[&*!|>%@`{]/ || v ~ /^[-?] /) bad("unquoted value starts with a YAML indicator — double-quote the whole value")
        }
        END { exit st }
    ' "$f" || status=1
done
exit $status
