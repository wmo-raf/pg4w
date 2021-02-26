#!/bin/sh
if [ "$BACKEND" = "pg_tileserv" ]; then
  echo "Waiting for pg_tileserv backend..."

  while ! nc -z $BACKEND_HOST $BACKEND_PORT; do
    sleep 1
  done

  echo "pg_tileserv default backend"
fi

exec "$@"
