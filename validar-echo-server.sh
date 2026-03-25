docker compose -f docker-compose-dev.yaml up -d --build

response=$(echo "hola" | nc server 12345)
if [ "$response" == "hola" ]; then
    echo "action: test_echo_server | result: success"
else
    echo "action: test_echo_server | result: fail"
fi
