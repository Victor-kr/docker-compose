#!/bin/bash

export VAULT_ADDR=https://jc.vault.idtplateer.com:8200
export VAULT_TOKEN=hvs.ZoTCrDt5WjyyWsgkeBj3IjMR

cd ./django-sample-for-docker-compose
vault kv get --format=json kurly/docker/docker-compose | jq -r '.data.data.yml' > ./docker-compose.yml
sudo docker-compose up -d
