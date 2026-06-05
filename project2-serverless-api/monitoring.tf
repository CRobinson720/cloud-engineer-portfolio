resource "aws_sns_topic" "api_alerts" {
  name = "cloud-portfolio-api-alerts"

  tags = {
    Name    = "Cloud Portfolio API Alerts"
    Project = "cloud-engineer-portfolio"
  }
}

resource "aws_cloudwatch_metric_alarm" "lambda_errors" {
  alarm_name          = "portfolio-projects-api-lambda-errors"
  alarm_description   = "Lambda returned one or more errors during a five-minute period."
  namespace           = "AWS/Lambda"
  metric_name         = "Errors"
  statistic           = "Sum"
  period              = 300
  evaluation_periods  = 1
  threshold           = 1
  comparison_operator = "GreaterThanOrEqualToThreshold"
  treat_missing_data  = "notBreaching"

  dimensions = {
    FunctionName = aws_lambda_function.projects_api.function_name
  }

  alarm_actions = [aws_sns_topic.api_alerts.arn]
  ok_actions    = [aws_sns_topic.api_alerts.arn]
}

resource "aws_cloudwatch_metric_alarm" "lambda_throttles" {
  alarm_name          = "portfolio-projects-api-lambda-throttles"
  alarm_description   = "Lambda was throttled one or more times during a five-minute period."
  namespace           = "AWS/Lambda"
  metric_name         = "Throttles"
  statistic           = "Sum"
  period              = 300
  evaluation_periods  = 1
  threshold           = 1
  comparison_operator = "GreaterThanOrEqualToThreshold"
  treat_missing_data  = "notBreaching"

  dimensions = {
    FunctionName = aws_lambda_function.projects_api.function_name
  }

  alarm_actions = [aws_sns_topic.api_alerts.arn]
  ok_actions    = [aws_sns_topic.api_alerts.arn]
}

resource "aws_cloudwatch_metric_alarm" "lambda_duration_high" {
  alarm_name          = "portfolio-projects-api-lambda-duration-high"
  alarm_description   = "Average Lambda duration exceeded three seconds during a five-minute period."
  namespace           = "AWS/Lambda"
  metric_name         = "Duration"
  statistic           = "Average"
  period              = 300
  evaluation_periods  = 1
  threshold           = 3000
  comparison_operator = "GreaterThanThreshold"
  treat_missing_data  = "notBreaching"

  dimensions = {
    FunctionName = aws_lambda_function.projects_api.function_name
  }

  alarm_actions = [aws_sns_topic.api_alerts.arn]
  ok_actions    = [aws_sns_topic.api_alerts.arn]
}

resource "aws_cloudwatch_metric_alarm" "api_gateway_5xx" {
  alarm_name          = "portfolio-http-api-5xx-errors"
  alarm_description   = "API Gateway returned one or more 5xx responses during a five-minute period."
  namespace           = "AWS/ApiGateway"
  metric_name         = "5xx"
  statistic           = "Sum"
  period              = 300
  evaluation_periods  = 1
  threshold           = 1
  comparison_operator = "GreaterThanOrEqualToThreshold"
  treat_missing_data  = "notBreaching"

  dimensions = {
    ApiId = aws_apigatewayv2_api.http_api.id
    Stage = aws_apigatewayv2_stage.default.name
  }

  alarm_actions = [aws_sns_topic.api_alerts.arn]
  ok_actions    = [aws_sns_topic.api_alerts.arn]
}

resource "aws_cloudwatch_dashboard" "api_monitoring" {
  dashboard_name = "cloud-portfolio-api-monitoring"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6

        properties = {
          title  = "Lambda Invocations, Errors, and Throttles"
          region = "us-west-2"
          period = 300
          stat   = "Sum"

          metrics = [
            [
              "AWS/Lambda",
              "Invocations",
              "FunctionName",
              aws_lambda_function.projects_api.function_name
            ],
            [
              "AWS/Lambda",
              "Errors",
              "FunctionName",
              aws_lambda_function.projects_api.function_name
            ],
            [
              "AWS/Lambda",
              "Throttles",
              "FunctionName",
              aws_lambda_function.projects_api.function_name
            ]
          ]
        }
      },
      {
        type   = "metric"
        x      = 12
        y      = 0
        width  = 12
        height = 6

        properties = {
          title  = "Lambda Duration"
          region = "us-west-2"
          period = 300
          stat   = "Average"

          metrics = [
            [
              "AWS/Lambda",
              "Duration",
              "FunctionName",
              aws_lambda_function.projects_api.function_name
            ]
          ]
        }
      },
      {
        type   = "metric"
        x      = 0
        y      = 6
        width  = 12
        height = 6

        properties = {
          title  = "API Gateway Requests and Errors"
          region = "us-west-2"
          period = 300
          stat   = "Sum"

          metrics = [
            [
              "AWS/ApiGateway",
              "Count",
              "ApiId",
              aws_apigatewayv2_api.http_api.id,
              "Stage",
              aws_apigatewayv2_stage.default.name
            ],
            [
              "AWS/ApiGateway",
              "4xx",
              "ApiId",
              aws_apigatewayv2_api.http_api.id,
              "Stage",
              aws_apigatewayv2_stage.default.name
            ],
            [
              "AWS/ApiGateway",
              "5xx",
              "ApiId",
              aws_apigatewayv2_api.http_api.id,
              "Stage",
              aws_apigatewayv2_stage.default.name
            ]
          ]
        }
      },
      {
        type   = "metric"
        x      = 12
        y      = 6
        width  = 12
        height = 6

        properties = {
          title  = "API Gateway Latency"
          region = "us-west-2"
          period = 300
          stat   = "Average"

          metrics = [
            [
              "AWS/ApiGateway",
              "Latency",
              "ApiId",
              aws_apigatewayv2_api.http_api.id,
              "Stage",
              aws_apigatewayv2_stage.default.name
            ],
            [
              "AWS/ApiGateway",
              "IntegrationLatency",
              "ApiId",
              aws_apigatewayv2_api.http_api.id,
              "Stage",
              aws_apigatewayv2_stage.default.name
            ]
          ]
        }
      }
    ]
  })
}