[version_1.0]

Note
The exercises in this course will have an associated charge in your AWS account. In this exercise, you create the following resources:

AWS Identity and Access Management (IAM) policy and user (Policies and users are AWS account features, offered at no additional charge)
AWS Cloud9 integrated development environment (IDE) instance
AWS CloudFormation stack
Amazon DynamoDB table
Familiarize yourself with AWS Cloud9 pricing, AWS CloudFormation pricing, Amazon DynamoDB pricing,and the AWS Free Tier.

Setting up
This exercise requires an IAM role that will be used with the AWS Cloud9 instance. It also requires a DynamoDB table that will be set up and then used in a later exercise. The CloudFormation stack will create these resources for you. You will also need to choose a Region where AWS App Runner is available.


Download the following CloudFormation template: exercise-containers.yml. This template will set up the backend resources that are needed to complete the exercise.

url= https://aws-tc-largeobjects.s3.us-west-2.amazonaws.com/DEV-AWS-MO-ContainersRedux/downloads/exercise-containers.yml

Note: If you have an existing Virtual Private Cloud (VPC) and it has a Classless Inter-Domain Routing (CIDR) block of 10.16.0.0/16, you must edit the template to change it.

Sign in to the AWS Management Console as a user that has administrator permissions.

Choose Services, and search for and open CloudFormation.

Choose Create stack.

For Specify template, choose Upload a template file.

Select Choose file and browse to where you downloaded the exercise-containers template.

Select the exercise-containers template and choose Open.

Choose Next.

For Stack name, enter exercise-containers.

Choose Next, and then choose Next again.

Select the acknowledgement and choose Create stack. Wait for the stack to complete.

Exercise 1: Creating the First Container
In this exercise, you create an AWS Cloud9 instance and modify some of the environment settings. You also install the prerequisites and source code that are needed to launch new container instances inside your AWS Cloud9 environment.

Task 1: Creating an AWS Cloud9 instance
In this task, you will create an AWS Cloud9 instance.

In the AWS Management Console, choose Services, and then search for and open Cloud9.

Choose Create environment.

For Name, enter containers-cloud9 and choose Next step.

Configure the following settings.
Instance type: t3.small (2 GiB RAM + 2 vCPU)
Network settings (advanced): Containers VPC
Choose Next step.

Choose Create environment.

Task 2: Modifying and deploying source code to AWS Cloud9
In this task, you will upgrade the AWS Command Line Interface (AWS CLI) version, and deploy the source code that’s needed to complete the exercise. You will also associate the instance profile with your AWS Cloud9 instance. Finally, you will expand your environment to give it more disk space.

In the AWS Cloud9 terminal, upgrade the AWS CLI version by running the following command.

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

unzip awscliv2.zip

sudo ./aws/install

. ~/.bashrc 
Copy to clipboard
Verify the version.

aws --version
Copy to clipboard
Download and extract the source code that you need for this exercise.

wget https://aws-tc-largeobjects.s3.us-west-2.amazonaws.com/DEV-AWS-MO-ContainersRedux/downloads/containers-src.zip
Copy to clipboard
unzip containers-src.zip
Copy to clipboard
Copy the instance ID and associate the instance profile with the AWS Cloud9 instance.

export INSTANCE_ID="`wget -q -O - http://169.254.169.254/latest/meta-data/instance-id`"

aws ec2 associate-iam-instance-profile --iam-instance-profile Name=cloud9-containers-role --instance-id $INSTANCE_ID
Copy to clipboard
Make sure that the State is listed as associated.

aws ec2 describe-iam-instance-profile-associations
Copy to clipboard
Run the following command.

This command tells AWS Cloud9 to specifically disable the managed rotated credentials, and instead use the cloud9-containers-role that CloudFormation created from the template.

aws cloud9 update-environment  --environment-id $C9_PID --managed-credentials-action DISABLE
Copy to clipboard
Wait for a couple of minutes, and then run the following command:

aws sts get-caller-identity
Copy to clipboard
You should see an Amazon Resource Name (ARN) that matches a role in the CloudFormation template:

arn:aws:sts::0123456789012:assumed-role/cloud9-containers-role/i-xxxxxxxxxxxxxxxxxx
Copy to clipboard
Expand the AWS Cloud9 disk by running the following utility:

bash utilities/c9-resize.sh 40
Copy to clipboard
Task 3: Building the first container
In this task, you will pull the required images and build your first Docker container.

Change directory to first-container/.

cd first-container/
Copy to clipboard
Inspect the Dockerfile, and build a container image.

docker build -t first-container .
Copy to clipboard
View the Docker images.

docker image ls
Copy to clipboard
The application being served sits on port 8080 in the container image.

Publish port 8080 to your AWS Cloud9 host and make it available on port 8080.

docker run -d -p 8080:8080 --name webapp first-container
Copy to clipboard
View the running Docker containers.

docker ps
Copy to clipboard
View the logs that are being captured from the container.

docker logs webapp
Copy to clipboard
You will now view the application in a browser.

At the top of your AWS Cloud9 instance, choose Preview and then choose Preview Running Application.

You should see the running application.

Launch a shell inside the container.

You can use this shell to run commands within the container itself.

docker exec -it webapp /bin/sh
Copy to clipboard
In the container, look at the contents of the /app folder and view the contents of /app/input.txt.

ls /app

cat /app/input.txt
Copy to clipboard
In the container, view the process list.

ps -a
Copy to clipboard
Escape out of the container (you can escape out of the container by pressing Ctrl+D).

Stop and remove the running container.

docker stop webapp

docker rm webapp
Copy to clipboard
Task 4: Modifying the container with new data
In this task, you will change the input.txt file inside the container with new data. You can use a bind mount to mount a local file resource in place of /app/input.txt inside the container.

Create an ~/input.txt file with five words, with each word on a new line.

printf "cinco\ncuatro\ntres\ndos\nuno" > ~/input.txt
Copy to clipboard
Launch a container with the new file mounted in place of /app/input.txt.

docker run -d -p 8080:8080 \
-e MESSAGE_COLOR=#0000ff \
-v ~/input.txt:/app/input.txt \
--name webapp \
first-container
Copy to clipboard
You can configure an application that’s running in a container with environment variables. The containerized application takes MESSAGE_COLOR as an environment variable.

Visit the updated application in a browser by choosing Preview, Preview Running Application.

Force-remove the container.

docker rm -f webapp

