#!/bin/bash

# query if the table is already created
version_history=$(psql -U appuser -d lion_data -c "SELECT version, author FROM VersionHistory;")

if [ -z "$version_history" ]; then
    echo "Creating tables..."
    psql -U appuser -d lion_data -f /app/data/schema.sql
    echo "Tables created!"
else
    echo "Tables already created!"
    echo "Version history:"
    echo "$version_history"
fi
