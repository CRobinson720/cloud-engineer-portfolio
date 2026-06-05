output "api_endpoint" {
  value = aws_apigatewayv2_api.http_api.api_endpoint
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.projects.name
}

output "cloudwatch_dashboard_name" {
  value = aws_cloudwatch_dashboard.api_monitoring.dashboard_name
}

output "sns_alert_topic_arn" {
  value = aws_sns_topic.api_alerts.arn
}