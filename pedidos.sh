#!/usr/bin/env bash
produtos=("TV" "GELADEIRA" "TV" "HOMETHEATER" "COMPUTADOR" "MONITOR" "TABLET" "SOUNDBAR" "CELULAR" "NOTEBOOK")
INFLUXDB_ENDPOINT="${INFLUXDB_URL}/api/v2/write?org=infobarbosa&bucket=ecommerce&precision=ns"

echo "utilizando endpoint: ${INFLUXDB_ENDPOINT}"
while(true)
do
    curl --request POST \
        ${INFLUXDB_ENDPOINT} \
        --header "Authorization: Token 3y1c3NnlmA1kA061YlROSO0gE5a1ppH_1Ig5HSMCsCX3VKF6zkrBwAtC-Hr6c_TTU8B9kwYOPphDq6hwyw5tLw==" \
        --header "Content-Type: text/plain; charset=utf-8" \
        --header "Accept: application/json" \
        --data-binary "pedidos,produto=${produtos[${RANDOM:0:1}]},pais=BR quantidade=``${RANDOM:0:1}`` `date +%s%N`"


    curl --request POST \
        ${INFLUXDB_ENDPOINT} \
        --header "Authorization: Token 3y1c3NnlmA1kA061YlROSO0gE5a1ppH_1Ig5HSMCsCX3VKF6zkrBwAtC-Hr6c_TTU8B9kwYOPphDq6hwyw5tLw==" \
        --header "Content-Type: text/plain; charset=utf-8" \
        --header "Accept: application/json" \
        --data-binary "pedidos,produto=${produtos[${RANDOM:0:1}]},pais=US quantidade=``${RANDOM:0:1}`` `date +%s%N`"

    curl --request POST \
        ${INFLUXDB_ENDPOINT} \
        --header "Authorization: Token 3y1c3NnlmA1kA061YlROSO0gE5a1ppH_1Ig5HSMCsCX3VKF6zkrBwAtC-Hr6c_TTU8B9kwYOPphDq6hwyw5tLw==" \
        --header "Content-Type: text/plain; charset=utf-8" \
        --header "Accept: application/json" \
        --data-binary "pedidos,produto=${produtos[${RANDOM:0:1}]},pais=AU quantidade=``${RANDOM:0:1}`` `date +%s%N`"

    sleep 0.05
done

