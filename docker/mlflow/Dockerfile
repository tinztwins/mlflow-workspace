### mlflow image ###
# note: environment variables are located in .env
FROM python:3.9.15

ARG MLFLOW_VERSION
ARG SERVER_DIR=/server

RUN pip install mlflow==$MLFLOW_VERSION psycopg2==2.9.5 pysftp==0.2.9 && \
    mkdir -p ${SERVER_DIR}

COPY ./scripts/wait-for-it.sh ${SERVER_DIR}/
RUN chmod +x ${SERVER_DIR}/wait-for-it.sh

WORKDIR ${SERVER_DIR}

EXPOSE $MLFLOW_TRACKING_SERVER_PORT
