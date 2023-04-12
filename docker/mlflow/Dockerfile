### mlflow image ###
FROM python:3.9.15

ARG SERVER_DIR=/server

COPY ./requirements.txt ./
RUN pip install --upgrade pip && \
    pip install -r ./requirements.txt && \
    mkdir -p ${SERVER_DIR}

COPY ./scripts/wait-for-it.sh ${SERVER_DIR}/
RUN chmod +x ${SERVER_DIR}/wait-for-it.sh

WORKDIR ${SERVER_DIR}

EXPOSE 5000
