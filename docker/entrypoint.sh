#!/bin/sh -e
set -o pipefail
if [ `id -u` -eq 0 ]; then
  su-exec person:people "$@"
else
  exec "$@"
fi
