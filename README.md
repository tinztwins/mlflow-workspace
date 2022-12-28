# mlflow-workspace
This repo is part of the blog post ["How to setup an MLflow 2.0 Workspace with Docker?"](https://tinztwins.medium.com/how-to-setup-an-mlflow-2-0-workspace-with-docker-7e4938b695e5) on medium.com. 

## General
The [MLflow](https://mlflow.org/docs/latest/index.html) environment serves as a tracking server for the ML model parameters and for versioning the ML models. This project ueses MLflow version 2.0.1.

## Infrastructure services
The following four infrastructure services are used. These services can be started manually so that you get an MLflow working environment in docker.
* JupyterLab (docker-container: jupyter)
* MLflow Tracking Server (docker-container: mlflow)
* Artifact Store as SFTP Server (docker-container: sftp)
* Backend Storage as postgres db (docker-container: postgres)

### Start and stop the MLflow workspace
1. Run the script in the folder [/keys/generate_keys.sh](/keys/generate_keys.sh): `sh generate_keys.sh`
2. Start MLflow workspace: `docker-compose up --build`
3. Execute the following script (copies the known_hosts from mlflow to jupyter): `sh copy_known_hosts_docker.sh`
4. Visit http://0.0.0.0:5000 for MLflow UI
5. Visit http://0.0.0.0:8888 for JupyterLab UI (enter the token in the terminal for login)
6. Stop MLflow workspace: `docker-compose down`

### Adding new dependencies for JupyterLab
* Add new dependencies to file [docker/jupyter/requirements.txt](docker/jupyter/requirements.txt)

## Troubleshooting
* On Linux systems there may be permission problems with the Artifact Store. The current workaround is to set the permissions manually (sudo chmod -R 777). 

## Useful Tools
* SFTP-Server: [Cyberduck](https://cyberduck.io)
