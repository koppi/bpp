SHELL:=bash

all: debug release

debug::
	@echo "tests-debug"
	@for f in *.lua; do echo $$f; ../debug/bpp -f $$f; done

release::
	@echo "tests-release"
	@for f in *.lua; do echo $$f; ../release/bpp -f $$f; done
