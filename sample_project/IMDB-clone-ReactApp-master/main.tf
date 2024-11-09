# main.tf - Terraform configuration for deploying Docker container on EC2 with environment variables

# AWS provider configuration
provider "aws" {
  region = "us-west-2"  

# Define Terraform variables for DockerHub credentials
variable "dockerhub_username" {
  type        = string
  description = "DockerHub username"
  sensitive   = true  # Marking the variable as sensitive
}

variable "dockerhub_password" {
  type        = string
  description = "DockerHub password"
  sensitive   = true  # Marking the variable as sensitive
}

# Define the EC2 instance (virtual server)
resource "aws_instance" "react_app_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI (find an updated one if needed)
  instance_type = "t2.micro"  # Use a free-tier instance type (adjust if needed)

  # Attach the security group to the EC2 instance
  security_groups = ["${aws_security_group.react_app_sg.name}"]

  # User data: script to install Docker and run the app with environment variables
  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                amazon-linux-extras install docker -y
                service docker start
                usermod -a -G docker ec2-user

                # Log in to DockerHub using the environment variables
                echo "${var.dockerhub_username}:${var.dockerhub_password}" | docker login --username "${var.dockerhub_username}" --password-stdin

                # Docker commands to pull and run your app
                docker pull your-dockerhub-repo/your-app:latest
                docker run -d -p 3000:3000 your-dockerhub-repo/your-app:latest
              EOF

  # Automatically assign an Elastic IP (optional)
  associate_public_ip_address = true
}

# Define a security group (firewall rules) to allow HTTP and SSH access
resource "aws_security_group" "react_app_sg" {
  name        = "react_app_sg"
  description = "Allow HTTP and SSH access to the React app instance"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from any IP (be careful in production)
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP from any IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Output the public IP address of the EC2 instance
output "instance_ip" {
  value = aws_instance.react_app_instance.public_ip
}
