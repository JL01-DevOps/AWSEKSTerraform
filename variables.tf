#
# Variables Configuration
#

variable "cluster-name" {
  default = "terraform-eks-demo"
  type    = string
}

variable "cidr_block_subnet" {
  type = string
}

variable "policy-AmazonEKSClusterPolicy" {
}

variable "policy-AmazonEKSServicePolicy" {
}
