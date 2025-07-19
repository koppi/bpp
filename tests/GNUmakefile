SHELL:=bash

all: debug release

debug::
	@for f in *.lua; do\
		echo $$f;\
		../debug/bpp -f $$f;\
	done

release::
	@for f in *.lua; do\
		echo $$f;\
		../release/bpp -f $$f;\
	done
