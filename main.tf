resource "aws_instance" "demo_ec2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = ["${aws_security_group.webserver_sg.id}"]
  key_name               = "demo"
  tags = {
    "Name" = "prod_ec2_1"
  }
  user_data = <<-EOF
	#!/bin/bash
        exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
        /usr/bin/apt-get update
        DEBIAN_FRONTEND=noninteractive /usr/bin/apt-get upgrade -yq
        /usr/bin/apt-get install apache2 -y
        /usr/sbin/ufw allow in "Apache Full"
      	/bin/echo "Hello world " >/var/www/html/index.html
   EOF

}