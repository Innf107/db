#!/usr/bin/sh

set -euo pipefail

idris2 --build db.ipkg

build/exec/db $@

