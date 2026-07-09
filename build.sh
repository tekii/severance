#!/bin/sh
# build.sh — amalgamate MANIFEST-listed sources into the release artifacts
# (SEVERANCE.md, and RECORD.md when [record] is non-empty). See DESIGN.md,
# "The three-artifact model" / "Release mechanism".
#
# Usage: sh build.sh [OUTDIR]   (default OUTDIR: .)
#
# Frontmatter rules: version comes from VERSION; built-from carries the
# TAG NAME (v<version>), never a commit hash — the hash cannot be known
# before the release commit exists; date derives from VERSION's mtime so
# a rebuild is byte-identical between releases (make check depends on it).
set -eu
OUT="${1:-.}"
VERSION=$(cat VERSION)
DATE=$(date -r VERSION +%F)

# section NAME — list non-comment, non-blank entries of [NAME] in MANIFEST
section() {
    awk -v s="[$1]" '$0==s{f=1;next} /^\[/{f=0} f&&NF&&$0!~/^#/' MANIFEST
}

# frontmatter TYPE TITLE DESCRIPTION TAGS — OKF-conformant (type is the
# field OKF requires; title/description/tags/timestamp keep the artifact
# a valid citizen of consumers' OKF trees) + the release pin fields.
frontmatter() {
    printf -- '---\ntype: %s\ntitle: %s\ndescription: %s\ntags: %s\ntimestamp: %s\nversion: %s\nbuilt-from: v%s\n---\n' \
        "$1" "$2" "$3" "$4" "$DATE" "$VERSION" "$VERSION"
}

{
    frontmatter 'Convention' \
        'SEVERANCE — the severed multi-session workflow (SPEC)' \
        "The Severance workflow's binding law — constitution, conventions, profile contract — amalgamated at v$VERSION. Vendored copy: do not edit; update by re-vendoring a release." \
        '[severance, spec, workflow, vendored]'
    for f in $(section spec); do
        printf '\n<!-- ═══ source: %s ═══ -->\n\n' "$f"
        cat "$f"
    done
    ASSETS=$(section spec.assets)
    if [ -n "$ASSETS" ]; then
        printf '\n# Part III — Bootstrap assets (extract, do not retype)\n'
        for f in $ASSETS; do
            printf '\n### FILE: %s\n\n```\n' "$f"
            cat "$f"
            printf '```\n'
        done
    fi
} > "$OUT/SEVERANCE.md"

REC=$(section record)
if [ -n "$REC" ]; then
    {
        frontmatter 'Reference' \
            'SEVERANCE — experiment record (RECORD)' \
            "The Severance experiment's narrative record — conceit, prior art, learnings register — built at v$VERSION. For human readers; not loaded into sessions." \
            '[severance, record, experiment]'
        for f in $REC; do
            printf '\n<!-- ═══ source: %s ═══ -->\n\n' "$f"
            cat "$f"
        done
    } > "$OUT/RECORD.md"
fi
