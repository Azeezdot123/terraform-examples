# provider variable
variable "access_key_id" {
  type = string
}
variable "secret_access_key" {
  type = string
}
variable "region" {
  type = string
}

# main.tf  variable 
variable "name" {
  type = string
}
variable "keybase" {
  type        = string
  description = "Use a keybase:username"
}
