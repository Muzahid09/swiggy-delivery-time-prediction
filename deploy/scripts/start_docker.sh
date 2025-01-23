#!/bin/bash

# login in ecr
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 730335644260.dkr.ecr.ap-south-1.amazonaws.com


#pull the latest image
docker pull 730335644260.dkr.ecr.ap-south-1.amazonaws.com/food_repo:v1



# Check if the container is already running
if [[ $(sudo docker ps -aq -f name=ec2_first_container) ]]
then
  # Stop and remove the existing container
  sudo docker stop ec2_first_container
  sudo docker rm ec2_first_container
fi



# Run the Docker container
sudo docker run -d -p 8000:8000 -e DAGSHUB_USER_TOKEN=705171615cb002f197303ee05d8813d5f80e089a --name ec2_first_container 730335644260.dkr.ecr.ap-south-1.amazonaws.com/food_repo:v1