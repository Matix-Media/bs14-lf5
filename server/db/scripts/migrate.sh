#!/bin/bash
for file in server/db/migrations/*.sql; do
  echo "Applying migration: $file"
  psql -d "$POSTGRES_DB" -U "$POSTGRES_USER" -f "$file"
done