### postgres image ###
# note: environment variables are located in .env

FROM postgres:latest

COPY init.sql /docker-entrypoint-initdb.d/

EXPOSE $POSTGRES_PORT
