#!/bin/bash

PORT=$(grep SERVER_PORT ./server/config.txt | cut -d '=' -f2 | xargs) # Para eliminar los espacios
response=$(echo "Hola" | docker run --rm -i --network=tp0_testing_net subfuzion/netcat -w 2 server $PORT)

echo "Response: [$response]"
if [ "$response" == "Hola" ]; then
    echo "action: test_echo_server | result: success"
else
    echo "action: test_echo_server | result: fail"
fi
