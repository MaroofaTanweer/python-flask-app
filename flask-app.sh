#!/bin/bash
# A script that create a docker Container and kubernetes deployment in Kubernetes Cluster

image_name=flask-docker-app:latest
echo "enter name of the project directory:"
read dir_PATH
mkdir $dir_PATH
cd $dir_PATH
git clone https://github.com/MaroofaTanweer/Docker-Flask-Project-Smarttwigs.git
cd Docker-Flask-Project-Smarttwigs
sudo docker rmi $image_name
sudu docker rmi maroofatanweer/$image_name
sudo docker build -t $image_name .
echo "enter container_name:"
read container_name
sudo docker run --name $container_name -d -p 192.168.1.246:5050:5000 $image_name
sudo docker image tag $image_name maroofatanweer/$image_name
sudo docker login -u MaroofaTanweer
sudo docker image push docker.io/maroofatanweer/$image_name
kubectl apply -f docker-flask.yaml
kubectl apply -f docker-flask-svc.yaml
