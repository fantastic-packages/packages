#!/bin/sh

available="$(find feeds/* -type l | cut -f3 -d'/')"

for l in "$@"; do
	echo "$available" | grep -q "$l" || echo "Invalid: $l"
done
