SHELL:=bash

all: debug release

debug::
	@echo "tests debug ========================================================="
	@for f in *.lua; do \
		echo "* tests/$$f"; \
		../debug/bpp -f $$f 2>&1; \
	done || true

release::
	@echo "tests release ======================================================="
	@for f in *.lua; do \
		echo "* tests/$$f"; \
		../release/bpp -f $$f 2>&1; \
	done || true
