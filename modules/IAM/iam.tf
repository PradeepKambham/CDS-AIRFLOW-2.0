resource "aws_iam_role_policy" "ec2_policy" {
  name = var.ec2_policy_name
  role = var.ec2_role_id
  policy = "${file(var.ec2_policy_path)}"
}

resource "aws_iam_role" "ec2_role" {
  name = var.ec2_role_tag_name

  assume_role_policy = "${file(var.ec2_assume_policy_path)}"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = var.ec2_profile_name
  role = var.ec2_role_name
}

output "ec2_policy" {
  value = "${aws_iam_role_policy.ec2_policy.id}"
}

output "ec2_profile" {
  value = "${aws_iam_instance_profile.ec2_profile.id}"
}

output "ec2_role_name" {
  value = "${aws_iam_role.ec2_role.name}"
}

output "ec2_role_id" {
  value = "${aws_iam_role.ec2_role.id}"
}