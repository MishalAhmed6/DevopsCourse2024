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

# Mishal Ahmed - Full Stack Developer

## Contact Information
- **Location:** Islamabad, Pakistan
- **Phone:** (+92) 312-1315783
- **Email:** [ahmedmishal636@gmail.com](mailto:ahmedmishal636@gmail.com)
- **Date of Birth:** 2003

## Education
- **NUCES, FAST Islamabad**  
  **BS in Computer Science**  
  **Duration:** 2021 - Present

## Skills
- **Programming Languages:** C++, Java, Python, JavaScript, HTML, CSS
- **Web Technologies:** MERN Stack (MongoDB, Express, React, Node.js), ASP.NET
- **Databases:** SQL, MongoDB, Firebase
- **Other Tools:** SCENE BUILDER
- **Problem-Solving:** Algorithms, Debugging, Critical Thinking, Leadership

## Interpersonal Skills
- Communication
- Critical Thinking
- Problem Solving
- Leadership
- Continuous Learning

## Experience
- **Teacher’s Assistant | Expository Writing**  
  **FAST NU, Islamabad**  
  **Duration:** Jan 2024 - Present
- **Lab Demonstrator | Intro to Information Technology**  
  **FAST NU, Islamabad**  
  **Duration:** Aug 2023 - Jan 2024
- **Teacher’s Assistant | Digital Logic Design**  
  **FAST NU, Islamabad**  
  **Duration:** Aug 2023 - Jan 2024
- **Teacher’s Assistant | Object Oriented Programming**  
  **FAST NU, Islamabad**  
  **Duration:** Jan 2023 - Jun 2023

## Projects
- **Event Management System**  
  **Technologies:** MongoDB, Express, React, NodeJS, HTML, CSS  
  A system for managing events using the MERN stack.
  
- **Cafeteria Management System**  
  **Technologies:** ASP.NET, C#, HTML, CSS, JavaScript, SQL  
  A website for managing cafeteria operations.

- **Society Management System**  
  **Technologies:** ASP.NET, SQL, C#  
  A system for managing university societies.

- **Parcel Tracking Application (Prototype)**  
  **Technologies:** Java, Scene-Builder, SQL  
  A parcel management system built using Java-based frameworks.

## References
- **Marium Hida** (Lecturer, NUCES, FAST Islamabad)  
  Email: [marium.hida@nu.edu.pk](mailto:marium.hida@nu.edu.pk)
