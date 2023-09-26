variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "User-Jenkins"
}
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}
variable "instance_ami" {
  description = "AMI of EC2 instance"
  type        = string
  default     = "ami-03a6eaae9938c858c"
}
variable "vpc_id" {
  description = "Id of your VPC"
  type        = string
  default     = "vpc-0626c28f1025cdc84"
}
variable "security_group_name" {
  description = "Security group name"
  type        = string
  default     = "User-Jenkins_SG"
}