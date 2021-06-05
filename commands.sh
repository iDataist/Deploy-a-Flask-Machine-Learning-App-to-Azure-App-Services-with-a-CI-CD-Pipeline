# Connect cli and github
ssh-keygen -t rsa
cat /home/hui/.ssh/id_rsa.pub

# Run test with locust
python3 -m venv .locust
source .locust/bin/activate
pip install wheel locust
locust
# http://localhost:8089

# Deploy the webapp to Azure
az webapp up -g group20210605 -n credit-card-fraud-detection --sku F1

# Obtain credentials to connect Azure Pipeline and Azure Cloud Services 
az ad sp create-for-rbac --query "{ client_id: appId, client_secret: password, tenant_id: tenant }"
az account show --query "{ subscription_id: id }"

# ########Run Docker########
# Build image
docker build --tag=flasksklearn .

# List docker images
docker image ls

# Run flask app
docker run -p 8000:80 flasksklearn

# ########Upload Docker########
# Tags and uploads an image to Docker Hub
dockerpath="huiren/flasksklearn"

# Authenticate & Tag
echo "Docker ID and Image: $dockerpath"
docker login &&\
    docker image tag flasksklearn $dockerpath

# Push Image
docker image push $dockerpath 

# ########Run Kubernetes########
dockerpath="huiren/flasksklearn"

# Run in Docker Hub container with kubernetes
kubectl run flasksklearn\
    --generator=run-pod/v1\
    --image=$dockerpath\
    --port=80 --labels app=flasksklearn

# List kubernetes pods
kubectl get pods

# Forward the container port to host
kubectl port-forward flasksklearn 8000:80

