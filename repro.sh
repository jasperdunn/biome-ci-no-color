#!/bin/sh
# Each command writes to a pipe (not a terminal) with NO_COLOR=1.
# The script counts the ANSI escape codes in the output. Expected: 0.

ESC=$(printf '\033')

count() {
  NO_COLOR=1 npx biome "$@" index.js 2>&1 | grep -o "$ESC\[" | wc -l | tr -d ' '
}

echo "biome check:              $(count check)"
echo "biome format:             $(count format)"
echo "biome ci:                 $(count ci)"
echo "biome ci --colors=off:    $(count ci --colors=off)"
