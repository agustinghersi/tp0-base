response=$(docker compose -f docker-compose-dev.yaml exec -T client sh -c 'echo "hola" | nc server 12345')

echo "Response: [$response]"
if [ "$response" == "hola" ]; then
    echo "action: test_echo_server | result: success"
else
    echo "action: test_echo_server | result: fail"
fi
