#!/bin/bash

set -e

export CONFIG_PATH="/penumbra"

export AWS_ACCESS_KEY_ID=$S3_KEY
export AWS_SECRET_ACCESS_KEY=$S3_SECRET

if [ -n "$KEY_PATH" ]; then
  s3_uri_base="s3://${KEY_PATH}"
  if [ -n "$KEY_PASSWORD" ]; then
    file_suffix=".gpg"
  else
    file_suffix=""
  fi
fi

restore_key () {
  existing=$(aws s3 ls "${s3_uri_base}/$1" | head -n 1)
  if [[ -z $existing ]]; then
    echo "$1 backup not found"
  else
    echo "Restoring $1"
    aws s3 cp "${s3_uri_base}/$1" $CONFIG_PATH/$1$file_suffix

    if [ -n "$KEY_PASSWORD" ]; then
      echo "Decrypting"
      gpg --decrypt --batch --passphrase "$KEY_PASSWORD" $CONFIG_PATH/$1$file_suffix > $CONFIG_PATH/$1
      rm $CONFIG_PATH/$1$file_suffix
    fi
  fi
}

# Restore keys
if [ -n "$KEY_PATH" ]; then
  echo "using existing penumbra testnet config"
  restore_key $FILE_NAME

  # TODO: Only untar if the file extension is a .tar
  tar xvf $CONFIG_PATH/$FILE_NAME 
else
  echo "generating new penumbra testnet config"
  pd testnet join  --testnet-dir $CONFIG_PATH/testnet_data
fi

# NOTE: if tendermint dies here, the k8s pod should be unhealthy and restart
# but if that doesnt work then we need to make sure `tendermint` is always running
tendermint start --home $CONFIG_PATH/testnet_data/node0/tendermint --proxy-app=tcp://$PD_HOST &

pd start --host 0.0.0.0 --home $CONFIG_PATH/testnet_data/node0/pd