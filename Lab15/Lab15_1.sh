#!/bin/bash


sudo apt update
sudo apt upgrade -y
sudo apt install -y ca-certificates curl gnupg

sudo install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo chmod a+r /etc/apt/keyrings/docker.gpg


# Add Docker Repository
echo 
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] 
https://download.docker.com/linux/ubuntu 
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | 
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Create Project Directory
# mkdir express-docker-app
cd express-docker-app

# Create package.json
vi package.json
{
"name": "express-docker-app",
"version": "1.0.0",
"main": "app.js",
"dependencies": {
"express": "^4.18.2"
}
}

# STEP 7: Create Dockerfile
vi Dockerfile
vi DockerFile
FROM node:18
WORKDIR /app
COPY package*.json ./
ARG HTTP_PROXY
ARG HTTPS_PROXY
ENV http_proxy=$HTTP_PROXY
ENV https_proxy=$HTTPS_PROXY
RUN npm install
COPY . .
EXPOSE 8012
# Run the app
CMD ["node", "app.js"]

# Build Docker Image
sudo docker build --build-arg HTTP_PROXY=http://255hsbd013@ibab.ac.in:Ishitabadola@16@proxy.ibab.ac.in:3128 --build-arg HTTPS_PROXY=http://255hsbd013@ibab.ac.in:Ishitabadola@16@proxy.ibab.ac.in:3128 -t express-app .

# Run Container
sudo docker run -p 8012:8012 express-app
# Check Running Containers
sudo docker ps

# Stop Container
sudo docker stop 38661f3fb591

# Run Multiple Containers
sudo docker run -d -p 8013:8012 --name app1 express-app
sudo docker run -d -p 8012:8012 --name app2 express-app

# Docker Loin
sudo docker login -u Ishitabadola
sudo docker login -u ishitabadola

sudo docker images

# Tag Image
sudo docker docker tag express-app:latest ishitabadola/express-app:latest
sudo docker tag express-app:latest ishitabadola/express-app:latest

# Push Image to Docker Hub
sudo sudo docker push nribab/express-app:latest
sudo docker push nribab/express-app:latest
sudo docker push ishitabadola/express-app:latest

# Pull Image
sudo docker pull ishitabadola/express-app:latest
docker pull ishitabadola/express-app:latest

# Run Pulled Image
docker run -d -p 8014:8012 ishitabadola/express-app:latest
sudo docker run -d -p 8014:8012 ishitabadola/express-app:latest
cd express-docker-app/

# Check Containers Again
sudo docker ps

# Pull & Run Another Image
sudo docker pull inshikathakur/express-app:latest
sudo docker run -d -p 8015:8012 inshikathakur/express-app:latest

# ================================
sudo docker ps
sudo docker info

