# Docker Cheatsheet

## General

|**Command**|**Function**|
|-|-|
|`docker build -t img .`|Build image *img*|
|`docker run -v `pwd`:/app img cmd`|Run command *cmd* on image *img*|
|`docker rm $(docker ps -a -q)`|Delete all containers|
|`docker rmi $(docker images -q)`|Delete all images (**be careful!**)|
