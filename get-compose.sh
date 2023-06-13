#!/bin/bash

#export VAULT_ADDR=http://vault-lb-34c9b776-478907300.ap-northeast-2.elb.amazonaws.com
#export VAULT_TOKEN=

export VAULT_ADDR=https://jc.vault.idtplateer.com:8200
export VAULT_TOKEN=$(cat ./plateer-key)

mkdir -p ./docker/data

#vault kv get --format=json config/docker/docker-compose | jq -r '.data.data.yml' > ./docker-compose.yml
vault kv get --format=json kurly/docker/docker-compose | jq -r '.data.data.yml' > ./docker-compose.yml
sudo docker-compose up
