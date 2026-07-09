# Severance release tooling — see DESIGN.md, "Release mechanism".
# Sources are truth; the artifacts (SEVERANCE.md, RECORD.md) are rebuilt
# ONLY by `make release` and committed only in release commits (which are
# exactly the tagged commits). `make check` proves the committed artifacts
# equal a fresh rebuild — a check that can actually fail.
.POSIX:
.PHONY: release check

release:
	@sh build.sh .
	@echo "release: artifacts rebuilt (version $$(cat VERSION))"

check:
	@TMP=$$(mktemp -d) && trap 'rm -rf "$$TMP"' EXIT && \
	sh build.sh "$$TMP" && \
	status=0 && \
	for f in SEVERANCE.md RECORD.md; do \
	    if [ -f "$$f" ] || [ -f "$$TMP/$$f" ]; then \
	        diff -u "$$f" "$$TMP/$$f" || { echo "DRIFT: $$f differs from a fresh rebuild"; status=1; }; \
	    fi; \
	done && exit $$status
	@echo "check: artifacts match sources"
