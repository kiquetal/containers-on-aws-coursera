aws ecr get-login-password --region us-east-1  | docker login --username AWS --password-stdin <account>.dkr.ecr.us.east-1.amazon.com
aws ecr create-repository --repository-name hello-world --image-scanning-configuration scanOnPush=true --region us-east-1

docker tag <source_image> <target_image>

dockert push <target_image>
