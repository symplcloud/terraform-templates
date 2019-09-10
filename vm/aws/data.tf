# data "aws_ami" "ubuntu" {
#   most_recent = true
#   owners      = ["099720109477"]
#   name_regex  = "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server"

#   filter {
#     name   = "architecture"
#     values = ["x86_64"]
#   }

#   filter {
#     name   = "root-device-type"
#     values = ["ebs"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
# }
