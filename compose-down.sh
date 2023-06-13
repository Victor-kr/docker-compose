#!/bin/bash

# set vault env
#export VAULT_ADDR=http://vault-lb-34c9b776-478907300.ap-northeast-2.elb.amazonaws.com
#export VAULT_TOKEN=

export VAULT_ADDR=https://jc.vault.idtplateer.com:8200
export VAULT_TOKEN=$(cat ./plateer-key)

# create data folder
mkdir -p ./docker/data

# get compose file
#vault kv get --format=json config/docker/docker-compose | jq -r '.data.data.yml' > ./docker-compose.yml
vault kv get --format=json kurly/docker/docker-compose | jq -r '.data.data.yml' > ./docker-compose.yml

# get db info
DB_NAME=$(vault kv get --format=json kurly/docker/docker-compose | jq -r '.data.data.db')
DB_USER=$(vault kv get --format=json kurly/docker/docker-compose | jq -r '.data.data.user')
DB_PASS=$(vault kv get --format=json kurly/docker/docker-compose | jq -r '.data.data.password')

# change yml to vault db info
sed -i "s/\${DB_NAME}/$DB_NAME/g" docker-compose.yml
sed -i "s/\${DB_USER}/$DB_USER/g" docker-compose.yml
sed -i "s/\${DB_PASS}/$DB_PASS/g" docker-compose.yml


sudo docker-compose down

rm -rf docker-compose.yml
