# GDW: Coding Problems for SAP Engineer

### Problem Statement 1/2

Write a lambda handler function in language of your choice (Python/NodeJS) to perform below function

1. Make a HTTP GET call to a public cloud health API https://health.cloud.com/get with query string `region=us-east-1`.
2. Publish the health status of `compute` service to SNS topic considering following is the response from health API

```json
[
	{
		"region": "eu-west-1",
		"healthData": [
		    {
				"status": "pass",
				"version": "1",
				"serviceName" : "storage",
				"description": "health of storage service"
			},
			{
				"status": "failed", 
				"version": "1", 
				"serviceName" : "compute",
				"description": "health of compute service"
			},
			{
				"status": "degraded", 
				"version": "1", 
				"serviceName" : "database",
				"description": "health of database service"
			}
		]
	},
	{
		"region": "us-east-1",
		"healthData": [
		    {
				"status": "pass", 
				"version": "1", 
				"serviceName" : "storage",
				"description": "health of storage service"
			},
			{
				"status": "pass", 
				"version": "1", 
				"serviceName" : "compute",
				"description": "health of compute service"
			},
			{
				"status": "degraded", 
				"version": "1", 
				"serviceName" : "database",
				"description": "health of database service"
			}
		]
	}

]
```

> Note: Decent exception handling is appreciated

### Problem Statement 2/2

Write an infrastructure code in Terraform or Cloudformation for the lambda function in problem statement 1 to execute

1. SNS topic with data at rest encryption (preferred CMK)
2. Lambda function

>Note: Please ensure right permissions are granted
