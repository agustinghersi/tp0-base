response=$(echo "Hola" | docker run --rm -i --network=tp0_testing_net subfuzion/netcat -w 2 server 12345)

echo "Response: [$response]"
if [ "$response" == "hola" ]; then
    echo "action: test_echo_server | result: success"
else
    echo "action: test_echo_server | result: fail"
fi
