resource "aws_iam_role" "bootstrap-server-iam-role" {
  name               = "bootstrap-server-iam-role"
  assume_role_policy = file("scripts/bootstrap-server-role.yml")
}

resource "aws_iam_role_policy" "bootstrap-server-iam-policy" {
  name   = "bootstrap-server-iam-policy"
  role   = aws_iam_role.bootstrap-server-iam-role.id
  policy = file("scripts/bootstrap-server-policy.yml")
}

resource "aws_iam_instance_profile" "bootstrap-server-profile" {
  name = "bootstrap-server-profile"
  role = aws_iam_role.bootstrap-server-iam-role.id
}

resource "aws_eip" "bootstrap-server-eip" {
  instance = aws_instance.bootstrap-server.id
  vpc      = true
}
