# Create an IAM User
resource "aws_iam_user" "admin-user" {
  name = "lucy"
  tags = {
    description = "The technical leader of team B"
  }
}

# Create an password for the IAM User
resource "aws_iam_user_login_profile" "admin-user"{
    user = aws_iam_user.admin-user.name
    pgp_key = "keybase:headofstate"
    password_reset_required = true
}
output "password" {
  value = aws_iam_user_login_profile.admin-user.encrypted_password
}

# create an IAM policy
resource "aws_iam_policy" "AdminUsers" {
    name = "AdminUsers"
    policy = file("iam_policy.json")
}
resource "aws_iam_user_policy_attachment" "lucy-admin" {
    user = aws_iam_user.admin-user.name
    policy_arn = aws_iam_policy.AdminUsers.arn
}
