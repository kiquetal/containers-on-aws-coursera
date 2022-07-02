Reading 2.1
MICROSERVICE APPLICATIONS
When you design a new application or upgrade an existing application, you make decisions about the architecture of the application. You might have seen a small or older application that has a monolithic architecture. In a monolithic architecture, your application layers are built into a single deployable artifact, and calls between layers are simple function calls. This is a straightforward way to work, but it does have some disadvantages. Each application deployment is a deployment of the entire application, even if you change a single layer. It can also become difficult to mix programming languages if you need to make function calls between languages.

A microservice architecture is a popular alternative. With a microservice architecture, your application is decomposed into smaller, independent services. Services run independently and communicate with network protocols. By using independent services, you can do the following:

Scale and deploy individual services

Build teams around services that match business functions

Choose the correct programming language and technology for each service

The rapid pace of deployment in a distributed microservices architecture lends itself to containerization. If you need to make a change to a single service, you can deploy containers of the new version of the service and switch all communications to the new containers.

DOCKER COMPOSE
Docker Compose is a tool for automating tasks in a multi-container environment. You can define the container settings—such as ports, volumes, and commands—into a single YAML file. You can use a single Docker Compose command to launch multiple containers from the YAML file.

Starting with a sample docker-compose.yaml file, you can see how Docker parameters are defined into a declarative file.

services:
  wordpress:
    image: wordpress:latest
    ports:
      - "80:80"

  database:
    image: mysql:5.7
    environment:
      MYSQL_RANDOM_ROOT_PASSWORD: 1
      MYSQL_DATABASE: wordpress

The example YAML file creates two containers. The image setting sets the Docker image that will be used for the container. The ports setting defines the container ports that are made available on the host. The database container is configured with environment variables in the environment settings.

The simple example can be the following command: docker compose up. Docker Compose launches containers with the provided parameters, and creates a Docker network for the containers to communicate. These are all tasks you could perform by using Docker commands. Docker Compose can automate these steps for you.

After the containers launch, you can use some additional Docker Compose commands to interact with the containers and inspect them, such as the following:

docker compose exec: Run commands inside of the containers (for example, launch a shell inside the container environment)

docker compose logs: Inspect log output

docker compose down: Stop and remove the running containers

For more information, see the Overview of Docker Compose.
