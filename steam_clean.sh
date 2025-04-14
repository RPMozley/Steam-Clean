#!/usr/bin/env bash

# https://github.com/ValveSoftware/steam-for-linux/issues/9233
# Example: /dev/shm/u1000-Shm_0a1b2c3d

for f in /dev/shm/u"$UID"*; do
	# Ignore find error if no u1* exists.
	file="$(find "${f}" -type f 2>/dev/null)"
	if [ -n "${file}" ]; then
		if fuser "$file" >/dev/null 2>/dev/null; then
			continue
		fi
		rm -Iv "$file"
	fi
done;
