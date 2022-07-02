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


