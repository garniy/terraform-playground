count_node = 3

docker_image = "sergmartyniuk/docker-exhibitor-zookeeper"

subnet_cidr = "10.0.0.0/8"

instance_type = {
  dev = "t2.micro"
  test = "t2.medium"
}

vpc_id = {
  dev = "vpc-d4e901af"
  test = "vpc-09232d6e"
}

subnet = {
  dev = "subnet-bc696bf7"
  test = "subnet-10gd1c59"
}

security_group = {
  dev = "sg-ca1595bd"
  test = "sg-27f23s5a"
}

key_name = {
  dev = "dev_key_9sa87"
  test = "test_key_6lj2s"
}

ami = {
  dev = "ami-9a562df2"
  test = "ami-4bf3d731"
}

