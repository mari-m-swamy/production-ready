#!/bin/bash

ACCOUNT_ID=933367720501
REGION=us-east-1

DEV_REPO=933367720501.dkr.ecr.us-east-1.amazonaws.com/dev

echo "Logging into ECR..."
aws ecr get-login-password --region us-east-1 \
| docker login --username AWS \
--password-stdin 933367720501.dkr.ecr.us-east-1.amazonaws.com

echo "Pulling image..."
docker pull $DEV_REPO:latest

echo "Stopping old container..."
docker stop react-app || true
docker rm react-app || true

echo "Running container..."
docker run -d -p 80:80 --name react-app $DEV_REPO:latest
