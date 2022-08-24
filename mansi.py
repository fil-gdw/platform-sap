import boto3
import requests

health_api_url = "https://health.cloud.com/get"


def get_response_from_api():
    query_string = "region=us-east-1"
    response = requests.get(health_api_url, query_string)
    return response


def get_compute_health_status(resp):
    status = ''
    for i in resp['healthData']:
        if i['serviceName'] == "compute":
        status = i['status']
    return status


def publish_status_sns_topic(status):
    get_client = boto3.client("sns_topic")
    get_client.publish_sns(status)
    response_from_api = get_response_from_api()
    compute_health_status = get_compute_health_status(response_from_api)
    publish_status_sns_topic(compute_health_status)
