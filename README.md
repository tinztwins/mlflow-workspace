# MLflow Workspace

## Magic AI Newsletter
👉🏽 Join our free [Magic AI newsletter](https://tinztwins.gumroad.com/l/magic-ai-newsletter) for the latest AI updates!

## Support us
<a href="https://www.buymeacoffee.com/tinztwins" target="_blank"><img src="https://bitbucket.org/tinztwins/materials/raw/9c7e16f90082b88ed52164fab06f0dbed18c8c86/yellow_bmc.png" alt="Buy Me A Coffee" style="height: 41px !important; width: 174px !important;" ></a>

## General
The [MLflow](https://mlflow.org/docs/latest/index.html) environment serves as a tracking server for managing the machine learning lifecycle. The repo contains several infrastructure services that start in a Docker stack. 

## Infrastructure services
The Docker stack uses four infrastructure services. These services can be started manually so that you get an MLflow working environment in Docker.
* JupyterLab (docker-container: jupyter)
* MLflow Tracking Server (docker-container: mlflow)
* Artifact Store as SFTP Server (docker-container: sftp)
* Backend Storage as postgres db (docker-container: postgres)

### Start and stop the MLflow workspace
1. Start MLflow workspace: `sh start_docker_stack.sh`
2. Visit [http://127.0.0.1:5001](http://127.0.0.1:5001) for MLflow UI
3. Visit [http://127.0.0.1:8888](http://127.0.0.1:8888) for JupyterLab UI (enter the password `mlflow`)
4. Stop MLflow workspace: `sh stop_docker_stack.sh`

### Test your MLflow workspace setup
* Visit the JupyterLab ([http://127.0.0.1:8888](http://127.0.0.1:8888)) and execute the notebook [mlflow_example.ipynb](notebooks/mlflow_example.ipynb). If no error appears, then your MLflow workspace is set up correctly.

### Adding new dependencies for JupyterLab
* Add new dependencies to file [docker/jupyter/requirements.txt](docker/jupyter/requirements.txt)

## Troubleshooting
* On Linux systems there may be permission problems with the Artifact Store. The current workaround is to set the permissions manually (sudo chmod -R 777). 

## Useful Tools
* SFTP-Server: [Cyberduck](https://cyberduck.io)

## References
* [Deploy Your Own MLflow Workspace On-Premise with Docker](https://medium.com/towards-data-science/deploy-your-own-mlflow-workspace-on-premise-with-docker-b54294676f0b) in Towards Data Science / April 17, 2023
* [How to setup an MLflow 2.0 Workspace with Docker?](https://medium.com/dev-genius/how-to-setup-an-mlflow-2-0-workspace-with-docker-7e4938b695e5) in Dev Genius / Dec 4, 2022
