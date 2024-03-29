# Inform the output that the import is starting
echo "Importing the SQL dump. This will take a while…"

# Import the SQL dump using pv for progress
(
    pv --force -p /opt/mtg-database.sql | mysql \
        -u "$MYSQL_USER" \
        -p"$MYSQL_PASSWORD" \
        "$MYSQL_DATABASE"
) 2>&1 | stdbuf -o0 tr '\r' '\n'

# Inform the output that the import is done
echo "Successfully imported the SQL dump!"