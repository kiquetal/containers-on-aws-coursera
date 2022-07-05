#### Containers orchestration platforms

- Run and stop containers
- Configure netwoking specifications
- Manage permissions
- Integrate with external resources and services


#### Control plane and data plane

ECS= Control planes
Data plane = where the work is executed.(The resources)


#### ECS

- Task definition: Docker image, cpu and memory, launch type, docker networking, logging, data volume, iam role
- task: initiation of a task definition 
- Scheduler: places tasks on your cluster
- Service: runs and maintains a specified number of ec2 of a task definition simultaneously
- Container agent: sends informationa bout the current running tasks and resource utilization to amazon ECS.

#### Scheduling


- Service scheduler: enforce a specific number of hosts

- Daemon scheduler: enforce a image run on every host.

- Cron-like schedule: periodic tasks

#### Placement engine

Place your images on a pc with a specific characteristics.

#### Constraints

- Affinity
Places tasks based on group membership


- Distinct instance

Places each task on Amazon ECS or
amazon EKS

#### Strategies

- Binpack

Places tasks to optimize for utilization

- Spread

Places taks to ptimize for high availability

#### Scale containers on ECS.

- Launch types => can be ec2 or fargate
- Capacity providers => multiple strategies

#### Service Discovery

- You could use AWS Config Map

#### Debuggin with Amazon ECS

- Configuration and tasks. 

#### Fargate

- Is a serverlesscomput engine and hosting option for container based workloads.

#### AWS Copilot

AWS Copilot take your dockerfile and hosting configuration.
- application, serice and environment (loadbalancer between env)



