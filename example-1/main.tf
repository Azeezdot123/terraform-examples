resource "local_file" "testfile" {
    content = var.content
    filename = var.filename
}
output "just_test" {
    value = local_file.testfile.content
}





