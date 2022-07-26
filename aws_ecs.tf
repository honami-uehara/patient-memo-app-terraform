resource "aws_ecs_cluster" "ecs-cluster_patient_memo_app" {
      name = "ecs-cluster-patient-memo-app"
}

resource "aws_ecs_task_definition" "patient_memo_app_task" {
  family                = "patient-memo-app-service"
  container_definitions = file("./task_definitions/service.json")
  task_role_arn         = aws_iam_role.ecs_task_role_for_patient_memo_app.arn
  network_mode          = "bridge"
}
