output "instance_profile" {
  value = "${data.aws_iam_instance_profile.zk.arn}"
}

output "node_ips" {
  value = ["${aws_instance.zk.*.public_ip}"]
}