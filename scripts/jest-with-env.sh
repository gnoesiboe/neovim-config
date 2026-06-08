#!/bin/bash
# Sources .env from cwd (the service root) before running jest,
# mirroring the behaviour of `pnpm test` in service/package.json.
set -a
[ -f .env ] && source .env
set +a
exec pnpm jest "$@"
