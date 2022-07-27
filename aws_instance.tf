resource "aws_instance" "patient-memo-app-instance" {
    ami                         = "ami-0ffb5f4e03c892bc5"
    instance_type = "t2.small"
    monitoring =  true
    iam_instance_profile = aws_iam_instance_profile.ecs_instance_profile_for_patient_memo_app.name
    subnet_id = aws_subnet.public_subnet_1.id
    user_data = file("./user_data.sh")
    associate_public_ip_address = true
    vpc_security_group_ids =[
        "${aws_security_group.instance.id}",
    ]
    root_block_device {
        volume_size = "30"
        volume_type = "gp2"
}
}
