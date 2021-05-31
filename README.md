# Building a CI/CD Pipeline
[![CI](https://github.com/iDataist/Building-a-CI-CD-pipeline/actions/workflows/main.yml/badge.svg)](https://github.com/iDataist/Building-a-CI-CD-pipeline/actions/workflows/main.yml)

## Overview

Establishing a Continuous Integration/Continuous Delivery (CI/CD) pipeline is critical to enable high-quality customer service experiences in today’s digital world. In this project, I built a CI/CD pipeline that deploys a Flask Machine Learning application with GitHub Actions, Azure Pipelines and Azure App Services. First, I leveraged GitHub actions to implement continuous integration that includes install, lint and test steps. The code will always be checked automatically. Second, I used Azure pipeline for continuous delivery. Azure pipeline hooks right into Azure App Services and deployed my Flask application. Lastly, I tested the prediction capability of the machine learning application by giving it a JSON payload. 

## Project Plan

* [Trello board](https://trello.com/invite/b/991rrsp2/557a8a37842cf3151b22957d3173efb5/kanban-template)
    ![](screenshots/trello.png)
* [Time Estimate](https://github.com/iDataist/Building-a-CI-CD-pipeline/blob/main/time_estimate.xlsx)
    ![](screenshots/time.png)

## Architectural Diagram
![](screenshots/architecture_diagram.png)

## Key Steps

1. Source Control
    * Clone the project from GitHub and open the terminal (with azure-cli installed)
        ![](screenshots/azure_shell.png)
2. Continuous Integration
    * Test and lint the code locally by running the `make all` command from the `Makefile`
        ![](screenshots/make_all.png)
    * Test and lint the code with Github Action 
        ![](screenshots/github_action.png)
3. Continous Delivery
    * Test the app locally by running `python app.py` and generate predictions by running `bash make_prediction.sh`
    ![](screenshots/test_run1.png)
    * Deploy the machine learning app with Azure Pipelines  
        ![](screenshots/azure_pipeline1.png)
        ![](screenshots/azure_pipeline2.png)
4. Platform as a Service
    * View the deployed app on Azure Portal
        ![](screenshots/webapp1.png)
        ![](screenshots/webapp2.png)
    * Load-test the web app with locust
        ![](screenshots/locust.png)
    * Generate predictions from the deployed app by running `bash make_predict_azure_app.sh` 
        ![](screenshots/test_run2.png)
    * Review streamed log files from the deployed app
        ![](screenshots/log_stream.png)




