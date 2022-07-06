# Penumbra RPCs on Akash

Deploys Penumbra RPC nodes to Akash. 

This will generate a new testnet config for you by calling `pd testnet join` on startup.

If you wish to run this with your own config, set the following env vars to download your config from an s3 api compatible bucket (see: [penumbra validator](/validator/penumbra/testnet/deploy.example.yaml)):
 * S3_KEY
 * S3_SECRET
 * KEY_PATH
 * FILE_NAME

## Deploy Steps
* Deploy `deploy.example.yaml` on akash