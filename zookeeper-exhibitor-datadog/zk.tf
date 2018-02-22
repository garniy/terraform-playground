
variable "env" {}
variable "docker_image" {}
variable "count_node" {}

variable "instance_type" {type = "map"}
variable "key_name" {type = "map"}
variable "ami" {type = "map"}
variable "subnet" {type = "map"}
variable "vpc_id" {type = "map"}
variable "security_group" {type = "map"}

variable "datadog_api_key" {}

variable exhibitor_style { default = "" }

variable "iam_instance_profile_name" {default = "terraform_role"}

data "aws_availability_zones" "available" {}

data "aws_iam_role" "zk" {
  name = "terraform_role"
}

data "aws_subnet" "zk" {
  id = "${lookup(var.subnet, var.env)}"
}

data "aws_security_group" "zk" {
  id = "${lookup(var.security_group, var.env)}"
}

data "aws_iam_instance_profile" "zk" {
  name = "${var.iam_instance_profile_name}"
}

resource "aws_instance" "zk" {
  count = "${var.count_node}"

  instance_type = "${lookup(var.instance_type, var.env)}"
  ami = "${lookup(var.ami, var.env)}"
  key_name = "${lookup(var.key_name, var.env)}"

  iam_instance_profile = "${data.aws_iam_instance_profile.zk.name}"
  security_groups = ["${data.aws_security_group.zk.id}"]
  subnet_id = "${data.aws_subnet.zk.id}"

  user_data = "${element(data.template_file.cloud_config.*.rendered, count.index)}"

}
