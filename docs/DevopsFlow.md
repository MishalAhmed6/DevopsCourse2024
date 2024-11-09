# Complete DevOps Pipeline: Git to CI/CD to Docker to Kubernetes

This guide walks you through the process of setting up a DevOps pipeline from **Git** to **CI/CD**, **Docker** for containerization, and finally **Kubernetes** for deployment.

## Table of Contents

1. [GitHub Actions for CI/CD](#1-github-actions-for-cicd)
2. [Dockerizing the Application](#2-dockerizing-the-application)
3. [Deploying with Kubernetes](#3-deploying-with-kubernetes)
4. [Complete Pipeline Flow](#4-complete-pipeline-flow)

---

## 1. GitHub Actions for CI/CD

### Step 1: Create GitHub Actions Workflow

In your GitHub repository, create a `.github/workflows` directory, and inside it, create a file called `ci-cd.yml`.

#### Example `ci-cd.yml` for Node.js

```yaml
name: CI/CD Pipeline

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Set up Node.js
      uses: actions/setup-node@v2
      with:
        node-version: '14'

    - name: Install dependencies
      run: npm install

    - name: Run tests
      run: npm test

    - name: Build Docker image
      run: |
        docker build -t my-app .
        docker login -u ${{ secrets.DOCKER_USERNAME }} -p ${{ secrets.DOCKER_PASSWORD }}
        docker push my-app
## What happens in this workflow?
Install dependencies and run tests: It installs project dependencies and runs tests.
Docker image build and push: It builds the Docker image and pushes it to Docker Hub.
## 2. Dockerizing the Application
Step 2: Create a Dockerfile
At the root of your project, create a Dockerfile that defines how to build your Docker image.

Example Dockerfile for Node.js
Dockerfile
Copy code
FROM node:14

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 3000
CMD ["npm", "start"]
Build and Run Docker Container
To build the Docker image, run the following:

bash
Copy code
docker build -t my-app .
To run the Docker container:

bash
Copy code
docker run -p 3000:3000 my-app
3. Deploying with Kubernetes
Step 3: Create Kubernetes Deployment and Service
You can deploy your Dockerized app to Kubernetes. Here's how you define the deployment and expose it via a service.

Example deployment.yaml
yaml
Copy code
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
        - name: my-app
          image: my-dockerhub-username/my-app
          ports:
            - containerPort: 3000
---
apiVersion: v1
kind: Service
metadata:
  name: my-app-service
spec:
  selector:
    app: my-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 3000
  type: LoadBalancer
## Step 4: Apply Kubernetes Configuration
Apply the deployment and service configuration to your Kubernetes cluster:

bash
Copy code
kubectl apply -f deployment.yaml
This will deploy your application as a set of 3 pods (replicas) and expose it via a service.

## 4. Complete Pipeline Flow
Git → CI/CD → Docker → Kubernetes
Push Code to Git: Push your changes to GitHub (main branch).
GitHub Actions: The CI/CD pipeline