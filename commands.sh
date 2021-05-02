# Connect cli and github
ssh-keygen -t rsa
cat /home/hui/.ssh/id_rsa.pub

# Create a virtual environment¶
conda create -n py35 -c free scikit-learn=0.20.3
conda activate py35
conda install -c anaconda flask==1.0.2
conda install -c conda-forge pandas==0.24.2

# Run test with locust
python3 -m venv .locust
source .locust/bin/activate
pip install wheel locust
locust
# http://localhost:8089

# Deploy the webapp to Azure
az webapp up -g group20210501 -n webapp20210501 --sku F1

# Obtain credentials to connect Azure Pipeline and Azure Cloud Services 
az ad sp create-for-rbac --query "{ client_id: appId, client_secret: password, tenant_id: tenant }"
az account show --query "{ subscription_id: id }"
