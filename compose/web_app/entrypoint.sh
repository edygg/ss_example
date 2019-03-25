#!/bin/sh

set -e

until mysql -h "$MYSQL_DB_HOST" -u "$MYSQL_USER" --password="$MYSQL_PASSWORD" -e ""; do
  >&2 echo "MYSQL is unavailable - sleeping"
  sleep 1
done

>&2 echo "MYSQL is up - executing command"
exec "$@"