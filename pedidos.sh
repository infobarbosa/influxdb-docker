#!/usr/bin/env bash
produtos=("TV" "GELADEIRA" "HOMETHEATER" "COMPUTADOR" "MONITOR" "TABLET" "SOUNDBAR" "CELULAR" "NOTEBOOK")
paises=("BR" "US" "AU")
INFLUXDB_URL="${INFLUXDB_URL:-http://influxdb-demo:8181}"
DATABASE="${DATABASE:-ecommerce}"

echo "utilizando endpoint: ${INFLUXDB_URL}/api/v2/write"

while true; do
    for pais in "${paises[@]}"; do
        produto=${produtos[$((RANDOM % ${#produtos[@]}))]}
        quantidade=$(( (RANDOM % 5) + 1 ))
        preco=$(( (RANDOM % 5000) + 500 ))

        curl -sf -XPOST "${INFLUXDB_URL}/api/v2/write?bucket=${DATABASE}&precision=s" \
            --data-binary "pedidos,produto=${produto},pais=${pais} quantidade=${quantidade},preco=${preco}" || true
    done
    sleep 1
done
