variable "region" {
default     = "eu-west-2"
 description = "AWS Region"
 
  
  
}


variable "cidr_block" {
default     = "10.0.0.0/16"
 description = "VPC cider Block"
 type  = string

  
  
}


variable "Public-Subnet-1-cidr_block" {
default     = "10.0.1.0/24"
 description = "Public Subnet 1 Cider block"
 type  = string
  
  
}


variable "Public-Subnet-2-cidr_block" {
default     = "10.0.2.0/24"
 description = "Public Subnet 2 cider"
 type  = string
  
  
}


variable "Private-Subnet-1-cidr_block" {
default     = "10.0.3.0/24"
 description = "Private Subnet 1 cider"
 type  = string
  
  
}



variable "Private-Subnet-2-cidr_block" {
default     = "10.0.4.0/24"
 description = "Private Subnet 2 cider"
 type  = string
  
  
}



variable "AZ-1" {
default     = "eu-west-2a"
 description = "availability zone"
 type  = string
  
  
}



variable "AZ-2" {
default     = "eu-west-2b"
 description = "availability zone"
 type  = string
  
  
}





