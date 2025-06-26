variable "name" {
  description = "VPC resource names"
  type        = string
}

variable "availability_zones" {
  description = "Subnet availability zones"
  type        = list(string)
}
