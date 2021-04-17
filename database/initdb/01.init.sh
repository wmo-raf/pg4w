#!/bin/bash

psql -U ${DB_USER} -d ${DB_NAME} -c """DO \
    $do$ \
    BEGIN \
        CREATE EXTENSION IF NOT EXISTS postgis; \
        CREATE SCHEMA IF NOT EXISTS ${PG_SERVICE_SCHEMA}; \
        IF NOT EXISTS ( \
            SELECT FROM pg_catalog.pg_roles \
            WHERE  rolname = '${PG_SERVICE_USER}') THEN \
            CREATE ROLE ${PG_SERVICE_USER} LOGIN ENCRYPTED PASSWORD '${PG_SERVICE_USER_PASSWORD}'; \
            GRANT USAGE ON SCHEMA ${PG_SERVICE_SCHEMA} TO ${PG_SERVICE_USER}; \
            ALTER DEFAULT PRIVILEGES IN SCHEMA ${PG_SERVICE_SCHEMA} GRANT SELECT ON TABLES TO ${PG_SERVICE_USER}; \
        END IF; \
    END \
    $do$;""""
