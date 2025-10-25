#!/bin/bash
yum update -y0.
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo "Hello Sandeep Terraform" > /var/www/http/index.html