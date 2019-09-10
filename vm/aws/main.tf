provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "default" {
  ami           = "ami-07d0cf3af28718ef8"
  # ami           = "${data.aws_ami.ubuntu.id}"
  # instance_type = "t2.medium"
  # instance_type = "t3.medium"
  instance_type = "m4.large"
  # instance_type = "m4.xlarge"
  # instance_type = "m5.large"
  # instance_type = "m5.xlarge"
}
