from datetime import datetime, timezone
import os
import uuid

from flask import Flask, jsonify, request


app = Flask(__name__)

APP_NAME = os.getenv("APP_NAME", "cloud-engineer-portfolio-ecs-app")
ENVIRONMENT = os.getenv("ENVIRONMENT", "local")
VERSION = os.getenv("APP_VERSION", "1.0.0")


projects = [
    {
        "id": "project3-containerized-app-ecs",
        "name": "Containerized App on ECS Fargate",
        "status": "in-progress",
        "platform": "AWS ECS Fargate",
    }
]


def utc_now():
    return datetime.now(timezone.utc).isoformat()


@app.get("/")
def home():
    return jsonify(
        {
            "message": "Project 3 - Containerized Flask App on ECS Fargate",
            "app": APP_NAME,
            "environment": ENVIRONMENT,
            "version": VERSION,
            "timestamp": utc_now(),
            "endpoints": {
                "health": "/health",
                "list_projects": "/api/projects",
                "create_project": "/api/projects",
                "get_project": "/api/projects/<project_id>",
                "delete_project": "/api/projects/<project_id>",
            },
        }
    )


@app.get("/health")
def health():
    return jsonify(
        {
            "status": "healthy",
            "app": APP_NAME,
            "environment": ENVIRONMENT,
            "timestamp": utc_now(),
        }
    ), 200


@app.get("/api/projects")
def list_projects():
    return jsonify(
        {
            "count": len(projects),
            "projects": projects,
        }
    )


@app.post("/api/projects")
def create_project():
    data = request.get_json(silent=True) or {}

    name = data.get("name")
    if not name:
        return jsonify({"error": "Project name is required"}), 400

    project = {
        "id": str(uuid.uuid4()),
        "name": name,
        "status": data.get("status", "planned"),
        "platform": data.get("platform", "AWS"),
        "created_at": utc_now(),
    }

    projects.append(project)

    return jsonify(project), 201


@app.get("/api/projects/<project_id>")
def get_project(project_id):
    for project in projects:
        if project["id"] == project_id:
            return jsonify(project)

    return jsonify({"error": "Project not found"}), 404


@app.delete("/api/projects/<project_id>")
def delete_project(project_id):
    for project in projects:
        if project["id"] == project_id:
            projects.remove(project)
            return jsonify(
                {
                    "message": "Project deleted",
                    "deleted_project_id": project_id,
                }
            )

    return jsonify({"error": "Project not found"}), 404


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
