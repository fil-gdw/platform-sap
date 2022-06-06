import request
import boto3
import json
import logging
logging.setlevel('INFO')

def lambdahandler (context, event) :
    try{
    sns = boto3.client('SNS')
    output = request.get('https://health.cloud.com/get', params = 'region=us-east-1')
    result = json.load(output)
    statusCheck = null
    for element in result :
    if (element['region'] == 'us-east-1') ;
    healthStatus = element['healthData']
    for status in healthStatus :
    if (status['description'] == 'health of computer service') :
    statusCheck = status['status']
    if( statusCheck != null) :
    sns.publish(
    # publish to sns topic can't remember the wright parameters
    topicName : 'xxxx'
    description : statusCheck
    )
    } except (err){
    logging.info(str(err))
    }