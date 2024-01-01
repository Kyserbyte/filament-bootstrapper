# Filament Bootstrapper

This is a tiny tool repo that provide a fast and quick way to bootstrap a Filament/Laravel project by using docker containers to set a development environment

## Pre-requisites
You need to have docker installed on your machine. Please follow this guide to install it https://docs.docker.com/get-docker/

Please note that the tool is based on bash scripts so you can run it only on *nix systems (like Linux or MacOS)

## How to use it

The project is provided of a simple bash cli to manage all the operations.

First of all you need to clone this repo using your preferred way.

The cli is accessed by the `./manage` command.
This is the help message
```bash
Manage the laravel/filament project
Version: 0.9.0
Usage: manage [command]
Commands:
  build-docker-image    Build/rebuild the docker dev image
  create-admin-user     Create a new admin user that can access the dashboard
  migrate-db            Run the migration tasks for the DB
  run                   Run the docker containers defined in the compose.yml file
  generate              Generate the laravel/filament project by installing all required components (it is destructive)
  *                     Help
```

### Steps
The steps to initialize a new project are

#### Generate project
```bash
$ ./manage generate
```
this command create the `src` folder in the current working directory.
It creates the docker image that will be used as command executor and also as container to run the application.
It also installs all the required composer dependecies inside the _src_ folder.

#### Create the SQLite database
```bash
$ ./manage migrate-db
```
this command generates the SQLite database file (it will ask you to confirm the operation) and creates all the required db structure.

#### Create the admin user
```bash
$ ./manage create-admin-user
```
this command creates an admin user that can access the filament dashboard panel.

#### Run the application
```bash
$ ./manage run
```
this task run the application using the docker compose command and the built images. It spawn an `nginx` server at the address `http:\\localhost:8090`.
The Filament panel can is at `http:\\localhost:8090\admin`.

