#!/usr/bin/sh
find src -name "*.idr" | entr bash -c "clear; idris2 --build db.ipkg"