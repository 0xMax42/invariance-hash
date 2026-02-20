#!/bin/sh
set -eu

LC_ALL=C
export LC_ALL

if [ "$#" -eq 0 ]; then
    echo "usage: invariance-hash PATH..." >&2
    exit 1
fi

tmp="$(mktemp)"
trap 'rm -f "${tmp}"' EXIT

for path in "$@"; do
    if [ -f "${path}" ]; then
        printf 'FILE %s\n' "${path}" >>"${tmp}"
        sha256sum "${path}" >>"${tmp}"

    elif [ -d "${path}" ]; then
        printf 'DIR  %s\n' "${path}" >>"${tmp}"

        # Deterministic recursive hashing
        find "${path}" -type f -print0 |
            sort -z |
            xargs -0 sha256sum >>"${tmp}"

    else
        echo "ERROR: path not found: ${path}" >&2
        exit 1
    fi
done

sha256sum "${tmp}" | awk '{print $1}'
