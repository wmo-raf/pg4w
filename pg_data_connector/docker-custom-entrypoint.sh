#!/bin/sh

/wait

/usr/src/app/docker-entrypoint.sh

exec "$@"