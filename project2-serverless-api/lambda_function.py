import json
import os
import uuid

import boto3

dynamodb = boto3.resource("dynamodb")
table = dynamodb.Table(os.environ["TABLE_NAME"])


def build_response(status_code, body):
    return {
        "statusCode": status_code,
        "headers": {
            "Content-Type": "application/json",
            "Access-Control-Allow-Origin": "*",
            "Access-Control-Allow-Methods": "GET,POST,PUT,DELETE,OPTIONS",
            "Access-Control-Allow-Headers": "Content-Type",
        },
        "body": json.dumps(body),
    }


def lambda_handler(event, context):
    http_method = event.get("requestContext", {}).get("http", {}).get("method")
    path_parameters = event.get("pathParameters") or {}

    if http_method == "OPTIONS":
        return build_response(200, {"message": "CORS preflight successful"})

    if http_method == "GET":
        response = table.scan()
        return build_response(200, response.get("Items", []))

    if http_method == "POST":
        body = json.loads(event.get("body") or "{}")

        name = body.get("name")
        description = body.get("description")

        if not name or not description:
            return build_response(400, {"message": "Name and description are required"})

        project = {
            "project_id": str(uuid.uuid4()),
            "name": name,
            "description": description,
        }

        table.put_item(Item=project)

        return build_response(201, {
            "message": "Project created",
            "item": project,
        })

    if http_method == "PUT":
        project_id = path_parameters.get("id")
        body = json.loads(event.get("body") or "{}")

        name = body.get("name")
        description = body.get("description")

        if not project_id:
            return build_response(400, {"message": "Missing project id"})

        if not name or not description:
            return build_response(400, {"message": "Name and description are required"})

        response = table.update_item(
            Key={"project_id": project_id},
            UpdateExpression="SET #project_name = :name, description = :description",
            ExpressionAttributeNames={
                "#project_name": "name"
            },
            ExpressionAttributeValues={
                ":name": name,
                ":description": description
            },
            ReturnValues="ALL_NEW"
        )

        return build_response(200, {
            "message": "Project updated",
            "item": response.get("Attributes")
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