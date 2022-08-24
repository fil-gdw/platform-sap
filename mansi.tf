#terraform
resource "aws_sns_topic" "example 1" {
  name            = "user_updates_notify"
  kms_master_key  = "var.kms_key.kms_id"
  delivery_policy = var.delivery_policy
  display_name    = "myfirsttopic"
}
###### Lambda function to add item to dynamo db table
import boto3
def add_item_dynamodb:
table = boto3.client.dynamo_db('users')
item1 = {
"id" : 1,
"name" : "mansi",
"age": 28
}
table.insert(item1)
add_item_dynamodb