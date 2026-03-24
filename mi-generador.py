import sys
import yaml

docker_file = sys.argv[1]
clients = sys.argv[2]

def main():
    delete_docker_clients()
    write_docker_clients()

def delete_docker_clients():
    with open(docker_file, "r") as f:
        data = yaml.safe_load(f)
    services = data.get("services", {})
    for service_name in list(services.keys()):
        if service_name.startswith("client"):
            del services[service_name]
    data["services"] = services
    with open(docker_file, "w") as f:
        yaml.dump(data, f)


def write_docker_clients():
    with open(docker_file, "r") as f:
        data = yaml.safe_load(f)
    services = data.get("services", {})
    for num in range(1, int(clients) + 1):
        new_client = {
            "container_name": "client" + str(num),
            "image": "client:latest",
            "entrypoint": "/client",
            "environment": [
                "CLI_ID=" + str(num),
                "CLI_LOG_LEVEL"
            ],
            "networks": [
                "testing_net"
            ],
            "depends_on": [
                "server"
            ],
            "volumes": [
                "./client/config.yaml:/config.yaml"
            ]
        }
        services["client" + str(num)] = new_client
    data["services"] = services
    with open(docker_file, "w") as f:
        yaml.dump(data, f)

main()