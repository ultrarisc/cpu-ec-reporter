#!/bin/bash
set -euo pipefail

grub_file=/etc/default/grub
# Only match a complete argument in an active GRUB_CMDLINE_LINUX assignment.
console_pattern='(^[[:blank:]]*GRUB_CMDLINE_LINUX="([^"]*[[:blank:]])?)console=ttyS1,115200n8([[:blank:]]|")'

if [[ ! -r "$grub_file" ]]; then
    echo "Cannot read $grub_file" >&2
    exit 1
fi

if grep -qE "$console_pattern" "$grub_file"; then
    # Repeat to remove duplicate occurrences as well.
    sed -i -E ":again; s/$console_pattern/\\1\\3/; t again" "$grub_file"
    update-grub
fi
