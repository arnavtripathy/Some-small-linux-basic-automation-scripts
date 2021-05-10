resource "local_file" "name" {
    filename = var.users[count.index]
    content = var.content
    count = length(var.users)
  
}
