resource "aws_ecs_cluster" "ecs-cluster_patient_memo_app" {
      name = "ecs-cluster-patient-memo-app"
}

resource "aws_ecs_task_definition" "patient_memo_app_task" {
  family                = "patient-memo-app-service"
  container_definitions = file("./task_definitions/service.json")
  task_role_arn         = aws_iam_role.ecs_task_role_for_patient_memo_app.arn
  network_mode          = "bridge"
}

resource "aws_ecs_service" "rails_webapp_service" {
  name            = "patient-memo-app-service"
  cluster         = aws_ecs_cluster.ecs-cluster_patient_memo_app.id
  task_definition = aws_ecs_task_definition.patient_memo_app_task.arn
  desired_count   = 1
  launch_type     = "EC2"
  load_balancer {
    target_group_arn = aws_lb_target_group.http.arn
    container_name   = "rails-webapp"
    container_port   = "3000"
  }
}
