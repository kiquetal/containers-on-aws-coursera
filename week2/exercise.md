[version_1.0]

Exercise 3: Launching Containers with Docker Compose
In this exercise, you launch the containers by using Docker Compose.

Task 1: Installing and building Docker Compose
In this task, you will install Docker Compose. You will then build with Docker Compose by using the docker-compose.yml file, which will launch four containers.

In the AWS Management Console, choose Services, and then search for and open Cloud9.

Open your AWS Cloud9 integrated development environment (IDE)instance.

To install Docker Compose, run the following command.

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
Copy to clipboard
Build by using the docker-compose.yml file.

cd ~/environment

docker-compose build
Copy to clipboard
Task 2: Launching the containers for the frontend and services
In this task, you will launch the containers through Docker Compose.

Launch the containers.

docker-compose up -d
Copy to clipboard
Check the status of your running containers.

docker-compose ps
Copy to clipboard
You should see four containers:
The directory service
A local developer edition of Amazon DynamoDB
A frontend Flask application
An AWS Command Line Interface (AWS CLI) container (it will create the DynamoDB table and exit)
Exec into the directory-frontend container.

docker-compose exec directory-frontend bash
Copy to clipboard
Inside the container, run the following commands.

ps -x

# you can access the "service" container from the front end to see the users data
curl directory-service/employee

exit
Copy to clipboard
View the application frontend by choosing Preview, Preview Running Application.

Add some users to the corporate directory by choosing Add, filling out the form, and choosing Save.

View the logs from the directory-frontend container.

docker-compose logs directory-frontend
Copy to clipboard
Stop and remove the Docker resources by running the docker-compose down command.

docker-compose down
Copy to clipboard
© 2022 Amazon Web Services, Inc. or its affiliates. All rights reserved. This work may not be reproduced or redistributed, in whole or in part, without prior written permission from Amazon Web Services, Inc. Commercial copying, lending, or selling is prohibited. Corrections, feedback, or other questions? Contact us at https://support.aws.amazon.com/#/contacts/aws-training. All trademarks are the property of their owners.
