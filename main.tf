terraform {
  backend "s3" {
    bucket = "sahil-project"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
	region = "us-east-1"
}

data "template_file" "userdata_client" {
  template = "${file("templates/userdata_client.tpl")}"
}

resource "aws_instance" "c0m1" {
	ami = "ami-0affd4508a5d2481b"
	instance_type = "t2.micro"
	key_name = "Project_demo"
	user_data = "${data.template_file.userdata_client.rendered}"
	security_groups = [ "launch-wizard-1" ]
	tags = {
  	Name="C0m1"
  }
}


resource "aws_instance" "idx-1" {
	ami = "ami-0affd4508a5d2481b"
	instance_type = "t2.micro"
	key_name = "Project_demo"
	user_data = "${data.template_file.userdata_client.rendered}"
	security_groups = [ "launch-wizard-1" ]
	tags = {
  	Name="Idx-1"
  }
}

resource "aws_instance" "idx-2" {
	ami = "ami-0affd4508a5d2481b"
	instance_type = "t2.micro"
	key_name = "Project_demo"
	user_data = "${data.template_file.userdata_client.rendered}"
	security_groups = [ "launch-wizard-1" ]
	tags = {
  	Name="Idx-2"
  }
}

resource "aws_instance" "sh" {
	ami = "ami-0affd4508a5d2481b"
	instance_type = "t2.micro"
	key_name = "Project_demo"
	user_data = "${data.template_file.userdata_client.rendered}"
	security_groups = [ "launch-wizard-1" ]
	tags = {
  	Name="SH"
  }

}

resource "aws_instance" "uf" {
	ami = "ami-0affd4508a5d2481b"
	instance_type = "t2.micro"
	key_name = "Project_demo"
	user_data = "${data.template_file.userdata_client.rendered}"
	security_groups = [ "launch-wizard-1" ]
	tags = {
  	Name="UF"
  }

}

data "aws_eip" "static_ip_c0m1" {
  public_ip = "52.3.203.248"
}

data "aws_eip" "static_ip_idx-1" {
  public_ip = "3.219.10.91"
}

data "aws_eip" "static_ip_idx-2" {
  public_ip = "3.221.42.150"
}

resource "aws_eip_association" "static_ip_c0m1" {
  instance_id   = aws_instance.c0m1.id
  allocation_id = data.aws_eip.static_ip_c0m1.id
}

resource "aws_eip_association" "static_ip_idx-1" {
  instance_id   = aws_instance.idx-1.id
  allocation_id = data.aws_eip.static_ip_idx-1.id
}

resource "aws_eip_association" "static_ip_idx-2" {
  instance_id   = aws_instance.idx-2.id
  allocation_id = data.aws_eip.static_ip_idx-2.id
}
