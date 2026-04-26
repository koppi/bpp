#!/bin/bash
#
# Run debug/bpp with gdb interactively
#

SCRIPT="${1:-demo/basic/00-hello.lua}"

if command -v xvfb-run &> /dev/null && [ -z "$DISPLAY" ]; then
    eval xvfb-run -a gdb -q -ex "run" --args debug/bpp "$SCRIPT"
else
    eval gdb -q -ex "run" --args debug/bpp "$SCRIPT"
fi
