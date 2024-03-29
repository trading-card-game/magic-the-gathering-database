# Define the image tag and allow it to be overridden
ARG MYSQL_IMAGE_TAG=8.0.36-debian

# Use the official MySQL image as the base
FROM mysql:$MYSQL_IMAGE_TAG

# Run as user 'root'
USER root

# Update & install software
# See https://docs.docker.com/develop/develop-images/instructions/
RUN apt-get update && apt-get install -y \
    curl \
    pv \
    && rm -rf /var/lib/apt/lists/*

# Download & extract the SQL dump
RUN curl -s https://mtgjson.com/api/v5/AllPrintings.sql.xz \
    | xz -d -c > /opt/mtg-database.sql
