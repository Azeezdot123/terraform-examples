terraform {
  cloud {
    organization = "olamilekan"

    workspaces {
      name = "aws_dev"
    }
  }
}