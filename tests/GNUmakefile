SHELL:=bash

all: debug release

debug::
	@echo "tests debug/bpp======================================================"
	@for f in *.lua; do \
		echo "> debug/bpp -f $$f"; \
		(cd .. && ./debug/bpp -f tests/$$f) 2>&1; \
	done || true

release::
	@echo "tests release/bpp ==================================================="
	@for f in *.lua; do \
		echo "> release/bpp -f $$f"; \
		(cd .. && ./release/bpp -f tests/$$f) 2>&1; \
	done || true
