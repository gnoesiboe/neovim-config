#!/bin/bash
# Wraps PHPUnit to run inside Docker, translating host↔container paths.
#
# - File args: /Users/.../backstage/... → /var/www/backstage/...
# - --log-junit: redirected to a file inside the mounted volume, then moved
#   back to where neotest expects it (a host-only temp path).

HOST_ROOT="/Users/gijsnieuwenhuis/Projects/backstage"
CONTAINER_ROOT="/var/www/backstage"
JUNIT_HOST_PATH=""
JUNIT_MOUNTED_PATH=""

ARGS=()
for arg in "$@"; do
    if [[ "$arg" == --log-junit=* ]]; then
        JUNIT_HOST_PATH="${arg#--log-junit=}"
        TMP_NAME=".phpunit-neotest-$(basename "$JUNIT_HOST_PATH")"
        JUNIT_MOUNTED_PATH="${HOST_ROOT}/${TMP_NAME}"
        ARGS+=("--log-junit=${CONTAINER_ROOT}/${TMP_NAME}")
    elif [[ "$arg" == "${HOST_ROOT}"* ]]; then
        ARGS+=("${CONTAINER_ROOT}${arg#${HOST_ROOT}}")
    else
        ARGS+=("$arg")
    fi
done

cd "$HOST_ROOT"
docker compose exec -T backstage ./vendor/bin/phpunit "${ARGS[@]}"
EXIT_CODE=$?

if [ -n "$JUNIT_MOUNTED_PATH" ] && [ -f "$JUNIT_MOUNTED_PATH" ]; then
    # Rewrite container paths → host paths so neotest can match test IDs
    sed "s|${CONTAINER_ROOT}|${HOST_ROOT}|g" "$JUNIT_MOUNTED_PATH" > "$JUNIT_HOST_PATH"
    rm "$JUNIT_MOUNTED_PATH"
fi

exit $EXIT_CODE
