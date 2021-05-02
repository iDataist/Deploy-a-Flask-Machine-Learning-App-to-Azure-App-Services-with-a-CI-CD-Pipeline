# Building a CI/CD Pipeline
[![CI](https://github.com/iDataist/Building-a-CI-CD-pipeline/actions/workflows/main.yml/badge.svg)](https://github.com/iDataist/Building-a-CI-CD-pipeline/actions/workflows/main.yml)
## Overview
Establishing a Continuous Integration/Continuous Delivery (CI/CD) pipeline is critical to enable high-quality customer service experiences in today’s digital world. In this project, I built a Continuous Delivery pipeline that deploys a Flask Machine Learning application using Azure Pipelines to Azure App Services. First, I used Github Actions to perform an initial install, lint, and test cycle on a machine learning application running in Flask in Azure App Services. Second, I integrated Continuous Delivery using Azure Pipelines to deploy tested application changes automatically to production. Lastly, I tested the prediction capability of the machine learning application deployed into production. 

## Project Plan

* [Trello board](https://trello.com/invite/b/991rrsp2/557a8a37842cf3151b22957d3173efb5/kanban-template)
* [Time Estimate](https://github.com/iDataist/Building-a-CI-CD-pipeline/blob/main/time_estimate.xlsx)

## Instructions
* Review the architectural diagram of the project
    ![](screenshots/architecture_diagram.png)
* Clone the project and open the terminal with azure-cli installed
    ![](screenshots/azure_shell.png)
* Run the `make all` command from the `Makefile`
    ![](screenshots/make_all.png)
* Test and lint the code with Github Action 
    ![](screenshots/github_action.png)
* Test the app locally by running `python app.py` and generate predictions by running `bash make_prediction.sh`
    ![](screenshots/test_run1.png)
* Deploy the web app to Azure by running `az webapp up -g group20210501 -n webapp20210501 --sku F1`
    ![](screenshots/webapp1.png)
    ![](screenshots/webapp2.png)
* Deploy the project with Azure Pipelines  
    ![](screenshots/azure_pipeline1.png)
* Run Azure App Service from Azure Pipelines automatic deployment
    ![](screenshots/azure_pipeline2.png)
* Load test the web app with locust
    ![](screenshots/locust.png)
* Generate predictions from the deployed app by running `bash make_predict_azure_app.sh` 
    ![](screenshots/test_run2.png)
* Review streamed log files from the deployed app
    ![](screenshots/log_stream.png)
## Enhancements
Containerize the webapp and deploy it with AKS.
## Demo 




