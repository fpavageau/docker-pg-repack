# Docker image with pg_repack for AWS RDS PostgreSQL 11

## Prerequisites

- Docker

## Build

    docker build -t pg-repack .
    
## Usage

    docker run --rm -ti pg-repack bash

then, in the container:

    pg_repack -h some.host -d dbname -u username -k -t schema.table

where `some.host` could be `host.docker.internal` to use a tunnel to access an AWS RDS instance.

⚠️  `-k` is essential on AWS RDS as the master user does not have the `Superuser` role, but only a trimmed down role
called `rds_superuser`.
    
----

Licensed under the Apache License, Version 2.0
