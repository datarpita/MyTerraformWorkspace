variable "lbname" {

    type = string
    #default="newloadbalancer"
  
}

variable "alb_name" {
  type=string
  default=null
}

variable "az_list" {
    type=list(string)
    default=null
}
variable "timeout" {
    type=number
}

variable "protocol"{
    type=list(string)
}

variable "ports" {
    type=map(number)
    default = {}  
}