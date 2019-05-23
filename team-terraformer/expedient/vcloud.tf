# Connect to the Expedient vCloud Director
variable "user" {type = "string"}
variable "password" {type = "string"}
variable "org" {type = "string"}
variable "vdc" {type = "string"}

provider "vcd" {
    user        = "${var.user}"
    password    = "${var.password}"
    org         = "${var.org}"
    vdc         = "${var.vdc}"
    url         = "https://expedient.cloud/api"
}

resource "vcd_vapp" "Test-vApp" {
    name = "Test-vApp"

metadata {
    CostAccount = "Team-Terraformers"
  }
}

resource "vcd_vapp_vm" "MD2-CP-WebApp1" {
  vapp_name     = "Test-vApp"
  name          = "MD2-CP-WebApp1"
  catalog_name  = "EEC-Templates-ACM"
  template_name = "2016-template"
  memory        = 8192
  cpus          = 2
  cpu_cores     = 1
}