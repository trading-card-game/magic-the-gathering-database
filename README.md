# Magic the Gathering Database

This project is intended to provide a local **[MySQL](https://www.mysql.com/)** database for **[Magic the Gathering](https://magic.wizards.com/en)** cards based on SQL dumps of **[MTGJSON](https://mtgjson.com)**.

## Requirements

The following software is required to run the project:

- Docker

In order to access the database, you will have to use an MySQL client. This project already contains [PHPMyAdmin](https://www.phpmyadmin.net/) to provide a browser based MySQL client. In case you do want to use a native client, there are some free recommendations:

- [DBeaver](https://dbeaver.io/)
- [HeidiSQL](https://www.heidisql.com/)
- [MySQL Workbench](https://dev.mysql.com/downloads/workbench/)

## Getting started

**The following steps are intended to setup the project and access the database locally.**

> **Attention:** Importing the database __will take a while__. Please read the [logging](#watching-the-log) secion for more information on how to see the progress of the import.

### Building the image

```sh
docker compose build
```

> **Attention:** You can use the `--no-cache` option to completely re-build the image in case something goes wrong.

### Running the container

In order to start the container, simply run the following command:

```sh
docker compose up -d
```

This will start the container in the background. 

> **Attention:** Please keep in mind, that this might take a while since it will also start the import of the SQL dump.

> **Attention:** You can omit the `-d` option to run the container in the foreground of the current terminal.

### Watching the log

In many cases it is helpful to take a look into the log of the container. Since the container will import an SQL dump containing all cards on first startup, you will want access the log in order to see the current progress Simply use the following command to follow the log output in the current terminal.

```sh
docker compose logs -f mysql
```

> **Attention:** You will have to wait for the output `Finished populating databse!` before you can proceed with [connect to the database](#connecting-to-the-database).

### Connecting to the database

**As this project is just a MySQL database, there are many ways to interact with it.**

The default username and password to access the database are `mtg`.

#### PHPMyAdmin (builtin)

You can access the builtin PHPMyAdmin panel under http://localhost:8080.

> **Attention:** The PHPMyAdmin container will only start **after** the import of the SQL dump is done. Please read the [logging](#watching-the-log) section for more information.

#### MySQL Client

Use the following connection information in order to use any other MySQL client:

- Port: `3307`
- Database: `mtg`
- Username: `mtg`
- Password: `mtg`

## Tipps

### Deleting the database

In case of an update to the SQL dump or unwanted modifications to the database, it is necessary to delete the volumes of the MySQL container and start a new. To do so, simply use the `down` command with the `-v` option like in the following example:

```sh
docker compose down -v
```

After this, you will have to start over with [running the container](#running-the-container).

## Thank You

A special thank you goes to [docker-mysql-mtg](https://github.com/CallMeHK/docker-mysql-mtg) which this project has been inspired of.

## Other Projects

The following is a list of similiar projects:

- [docker-mysql-mtg](https://github.com/CallMeHK/docker-mysql-mtg)