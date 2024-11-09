## DevopsCourse2024

## A Guide to My Learning and Contribution to the Field
- **File:** [LEARNING_GUIDE.md](learning_materials/LEARNING_GUIDE.md)
- In this file, I have documented the core DevOps practices I’ve learned, including:
  - **Docker**
  - **Yaml**
  - **K8S**
  - **Terraform**
- I also shared my contributions and projects where I applied these practices.

## Summary of my Last Two DevOps Blogs
- **File:** [BLOG_SUMMARIES.md](resources/BLOG_SUMMARIES.md)
- Here I chose the last two blogs I wrote and provided key takeaways from each.

## Sample Repo with DevOps Tooling
- **Folder:** `sample_project/IMDB-clone-ReactApp-master`
- I cloned a basic **React** project and applied **Docker containerization** to it.
- I included a **Dockerfile** to containerize the React app.
- I added a main.tf file for terraform. 

### Terraform Configuration

1. **EC2 Instance Setup**: The `main.tf` file contains Terraform configuration to deploy an **AWS EC2 instance** and run the React app inside a **Docker container**. 

2. **Security Group**: The configuration defines a **security group** that allows SSH access (on port 22) and HTTP access (on port 3000) to the EC2 instance, enabling you to interact with the app once it's deployed.

3. **User Data Script**: The EC2 instance is configured with a **user data script** that installs Docker, pulls the Docker image of the React app from DockerHub (or a local Dockerfile), and runs it in a container. The script also allows Docker login using environment variables to secure credentials.

4. **Environment Variables**: The Terraform configuration uses **environment variables** for DockerHub credentials to avoid exposing sensitive information in the codebase. 

#### Prerequisites:
- Terraform installed.
- AWS account credentials configured (either through environment variables or AWS CLI).
- DockerHub account (if pulling images from DockerHub).

## Github Landing Page
- I created a github landing page containing my CV, using the index.html file in my root directory the link for it is https://mishalahmed6.github.io/DevopsCourse2024/