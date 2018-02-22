data "template_file" "cloud_config" {
  count = "${var.count_node}"
  template = "${file("${path.cwd}/cloud-config.template.yaml")}"
  vars {
    node_name              = "exhibitor-${count.index+1}"
    ensemble_size          = "${var.count_node}"
    exhibitor_style        = "${var.exhibitor_style != "" ? var.exhibitor_style : "red" }"
    docker_image = "${var.docker_image}"

    datadog_api_key        = "${var.datadog_api_key}"
  }
}