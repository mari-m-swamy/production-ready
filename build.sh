#!/bin/bash

ACCOUNT_ID=933367720501
REGION=us-east-1

DEV_REPO=933367720501.dkr.ecr.us-east-1.amazonaws.com/dev

echo "Building image..."
docker build -t dev-app .

echo "Tagging image..."
docker tag dev-app:latest $DEV_REPO:latest

echo "Logging into ECR..."
aws ecr get-login-password --region us-east-1 \
| docker login --username AWS \
--password-stdin 933367720501.dkr.ecr.us-east-1.amazonaws.com

echo "Pushing to DEV ECR..."
docker push $DEV_REPO:latest
