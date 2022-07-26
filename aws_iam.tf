 resource "aws_iam_user" "github_actions" {
  name = "github-actions-for-patient-memo-app"
}

resource "aws_iam_policy" "deploy" {
      name        = "deploy"
      path        = "/"
      description = "deploy policy"
      policy      = file("aws_iam_policies/image_deploy_policy.json")
}

resource "aws_iam_user_policy_attachment" "deploy-attach" {
      user       = aws_iam_user.github_actions.name
      policy_arn = aws_iam_policy.deploy.arn
}

resource "aws_iam_role" "ecs_instance_role_for_patient_memo_app" {
      name               = "ecs-instance-role-for-patient-memo-app"
      path               = "/"
      assume_role_policy = file("aws_iam_policies/ec2_assume_role_policy.json")
  }

resource "aws_iam_policy" "ecs_instance_policy_for_patient_memo_app" {
  name        = "ecs-instance-policy-for-patient-memo-app"
  path        = "/"
  description = ""
  policy      = file("aws_iam_policies/ecs_instance_policy.json")
}

resource "aws_iam_policy" "ecs_instance_policy_for_patient_memo_app" {
  name        = "ecs-instance-policy-for-patient-memo-app"
  path        = "/"
  description = ""
  policy      = file("aws_iam_policies/ecs_instance_policy.json")
}

resource "aws_iam_role_policy_attachment" "ecs_instance_role_attach" {
    role = aws_iam_role.ecs_instance_role_for_patient-memo-app.name
    policy_arn = aws_iam_policy.ecs_instance_policy_for_patient-memo-app.arn
  }
