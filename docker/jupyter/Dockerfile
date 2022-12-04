### jupyter image ###
# note: environment variables are located in .env
ARG JUPYTER_SCIPY_IMAGE
ARG JUPYTER_SCIPY_VERSION
FROM jupyter/${JUPYTER_SCIPY_IMAGE}:${JUPYTER_SCIPY_VERSION}

ARG MLFLOW_VERSION

# set environment variables
ENV HOME_DIR=/home/$NB_USER
ENV WORK_DIR=$HOME_DIR/work

# libs:
## psycopg2: PostgreSQL database adapter
## tqdm: progress bar for python
## jupyter_contrib_nbextensions: contains a collection of community-contributed unofficial extensions
RUN conda install --quiet --yes \
        'psycopg2==2.9.3' \
        'conda-build==3.23.1' \
        'tqdm==4.64.1' \
        'jupyter_contrib_nbextensions==0.5.1' \
        'jupyter_nbextensions_configurator==0.4.1' && \
    conda build purge-all && \
    fix-permissions $CONDA_DIR

USER root
RUN ldconfig && \
    jupyter nbextension enable toc2/main --sys-prefix && \
    jupyter nbextension enable collapsible_headings/main --sys-prefix

# install python dependencies from requirements.txt - add new requirements to requirements.txt
#USER $NB_USER
RUN mkdir -p ~/.ssh && chmod 700 ~/.ssh

WORKDIR $WORK_DIR
COPY ./requirements.txt ./
RUN pip install --upgrade pip && \
    pip install mlflow==$MLFLOW_VERSION && \
    pip install -r ./requirements.txt && \
    fix-permissions $HOME_DIR
