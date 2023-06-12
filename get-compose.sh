#!/bin/bash

export VAULT_ADDR=http://vault-lb-34c9b776-478907300.ap-northeast-2.elb.amazonaws.com
export VAULT_TOKEN=hvs.t3EBl0pkz49Krw7XSSRmSM9Z

vault kv get --format=json config/docker/docker-compose | jq -r '.data.data.yml' > ./docker-compose.yml
sudo docker-compose up -d
