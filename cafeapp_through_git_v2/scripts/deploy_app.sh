#!/bin/bash

# Ensure Docker Compose is installed
sudo apt-get update -y
sudo apt-get install -y docker-compose

git clone https://github.com/sreepathysois/Cafe_Dynamic_Website.git

cd Cafe_Dynamic_Website



# Navigate to the Docker Compose file directory
#cd /tmp

# Deploy the application
sudo docker-compose up -d
