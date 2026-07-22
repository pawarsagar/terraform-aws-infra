variable "project_name"       { type = string }
variable "vpc_id"             { type = string }
variable "private_subnet_ids" { type = list(string) }
variable "db_instance_class"  { type = string }
variable "db_username"        { type = string }

variable "db_password" {
  type      = string
  sensitive = true
}

variable "web_sg_id" { type = string }
