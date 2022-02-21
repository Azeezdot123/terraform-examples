# creating a openssh key pair
resource "tls_private_key" "ubuntu_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "ubuntu_key" {
  key_name   = "ubuntu_ssh_key"
  public_key = tls_private_key.ubuntu_key.public_key_openssh
}
# saving the ssh key to a local file
resource "local_file" "ssh_key" {

  filename = "${aws_key_pair.ubuntu_key.key_name}.pem"
  content  = tls_private_key.ubuntu_key.private_key_pem
}