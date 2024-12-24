#!/bin/bash

# Ensure Docker Compose is installed
sudo apt-get update -y
sudo apt-get install -y docker-compose

# Navigate to the Docker Compose file directory
cd /tmp

# Deploy the application
sudo docker-compose up -d
