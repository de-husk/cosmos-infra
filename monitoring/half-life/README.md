# Deploying Half-Life on Akash


## Deploy Steps
* docker build . -t samangan/half-life:v1 --platform=linux/amd64
* docker push samangan/half-life:v1
* cp deploy.example.yaml deploy.yaml
* edit `deploy.yaml` with your discord_id, and discord_token
* Deploy `deploy.yaml` on akash