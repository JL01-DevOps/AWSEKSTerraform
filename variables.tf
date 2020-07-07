#
# Variables Configuration
#

variable "cluster-name" {
  default = "terraform-eks-demo"
  type    = string
}

variable "cidr_block" {
}

variable "policy-AmazonEKSClusterPolicy" {
}

variable "policy-AmazonEKSServicePolicy" {
}
