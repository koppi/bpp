SHELL:=bash

# Detect operating system
UNAME_S := $(shell uname -s)

# Set application command based on OS
ifeq ($(UNAME_S),Darwin)
    DEBUG_APP = open ../debug/bpp.app
    RELEASE_APP = open ../release/bpp.app
else
    DEBUG_APP = ../debug/bpp
    RELEASE_APP = ../release/bpp
endif

all: debug release

debug:
	@echo "tests debug/bpp======================================"
	@for f in *.lua; do \
		echo "> $(DEBUG_APP) -f $$f"; \
		(cd .. && $(DEBUG_APP) -f tests/$$f) 2>&1; \
	done || true

release:
	@echo "tests release/bpp =================================================="
	@for f in *.lua; do \
		echo "> $(RELEASE_APP) -f $$f"; \
		(cd .. && $(RELEASE_APP) -f tests/$$f) 2>&1; \
	done || true
