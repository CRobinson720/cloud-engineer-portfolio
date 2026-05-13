import json
import boto3
import os
import uuid

dynamodb = boto3.resource("dynamodb")
table = dynamodb.Table(os.environ["TABLE_NAME"])


def build_response(status_code, body):
    return {
        "statusCode": status_code,
        "headers": {
            "Content-Type": "application/json"
        },
        "body": json.dumps(body)
    }


def lambda_handler(event, context):
    http_method = event.get("requestContext", {}).get("http", {}).get("method")
    path_parameters = event.get("pathParameters") or {}

    if http_method == "GET":
        response = table.scan()
        items = response.get("Items", [])
        return build_response(200, items)

    if http_method == "POST":
        body = json.loads(event.get("body", "{}"))

        item = {
            "project_id": str(uuid.uuid4()),
            "name": body.get("name", "Unnamed Project"),
            "description": body.get("description", "")
        }

        table.put_item(Item=item)
        return build_response(201, {
            "message": "Project created",
            "item": item
        })

    if http_method == "DELETE":
        project_id = path_parameters.get("id")

        if not project_id:
            return build_response(400, {"message": "Missing project id"})

        table.delete_item(
            Key={"project_id": project_id}
        )

        return build_response(200, {
            "message": "Project deleted",
            "project_id": project_id
        })

    return build_response(405, {"message": "Method not allowed"})