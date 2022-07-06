# Penumbra Testnet

Penumbra doesnt use the cosmos sdk. So this will not use Cosmos-omnibus.

## Deploy Steps

### Setup Validator
* Follow [these](https://guide.penumbra.zone/main/pd/join-testnet.html#joining-as-a-fullnode) steps to create the validator key material locally.

### Deploy
* tar -cvz -f testnet_data.tar -C ~/.penumbra/ testnet_data
* aws s3 cp testnet_data.tar s3:/{config_bucket}/{config_tar_file}
* cp deploy.example.yaml deploy.yaml
* edit `deploy.yaml` with your S3 configs
* Deploy `deploy.yaml` on akash