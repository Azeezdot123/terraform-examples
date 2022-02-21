# Create an IAM User
resource "aws_iam_user" "admin-user" {
  name = var.name
}
# Create an access key id for the IAM user
resource "aws_iam_access_key" "admin-user" {
  user    = aws_iam_user.admin-user.name
  pgp_key = var.keybase
}

# Create an password for the IAM User
resource "aws_iam_user_login_profile" "admin-user" {
  user                    = aws_iam_user.admin-user.name
  pgp_key                 = var.keybase
  password_reset_required = true
}
# access_key_id
output "id" {
  value = aws_iam_access_key.admin-user.id
}
# password
output "password" {
  value = aws_iam_user_login_profile.admin-user.encrypted_password
}
# secret_key_id
output "encrypted_secret" {
  value = aws_iam_access_key.admin-user.encrypted_secret
}

# create an IAM policy
resource "aws_iam_policy" "AdminUsers" {
  name   = "Admin-Users"
  policy = file("iam_policy.json")
}
resource "aws_iam_user_policy_attachment" "lucy-admin" {
  user       = aws_iam_user.admin-user.name
  policy_arn = aws_iam_policy.AdminUsers.arn
}
