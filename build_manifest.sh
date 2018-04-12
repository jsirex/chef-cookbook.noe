#!/bin/sh

MANIEST_CONTENT="  manifest:
$(find src -type f | sort| sed 's|src/\(.*\)|    \1:\n      safe-override: false\n|')"

cat noespec.yaml.tpl | m4 -D__PLACEHOLDER__="$MANIEST_CONTENT" > noespec.yaml
cat noespec.yaml.tpl | m4 -D__PLACEHOLDER__="" > short.yaml
