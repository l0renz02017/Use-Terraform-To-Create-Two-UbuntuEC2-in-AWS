variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "availability_zone" {
  description = "AWS availability zone"
  type        = string
  default     = "us-east-1a"
}

variable "key_pair_name" {
  description = "Existing AWS key pair name for SSH access"
  type        = string
  default     = "my-key-pair"  # replace this with your key pair
}
