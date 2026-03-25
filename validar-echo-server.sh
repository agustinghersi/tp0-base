response=$(echo "Hola" | docker run --rm --network=tp0_testing_net subfuzion/netcat server 12345)

echo "Response: [$response]"
if [ "$response" == "hola" ]; then
    echo "action: test_echo_server | result: success"
else
    echo "action: test_echo_server | result: fail"
fi
