# Write Dockerfile for Project

### 🧩 Step 1: Base Image declaration
```bash
FROM php:8.2-alpine

# FROM nginx:alpine
# FROM httpd:alpine
# FROM node:18-alpine
# FROM openjdk:17-alpine
# FROM mcr.microsoft.com/dotnet/aspnet:8.0
```
### 🧩 Step 2: Copy Project Local Computer to Docker Image
```bash
# Set working directory
WORKDIR /var/www/html

# COPY <source> <destination>
COPY . .
```
📌 যদি /var/www/html না থাকে → Docker নিজে তৈরি করে নেয়

### 🧩 Step 3: Project RUN CMD
```bash
CMD ["php", "-S", "0.0.0.0:8000"]
```

### 🧩 Step 4: RUN others commands
```bash
RUN apk add --no-cache git unzip zip

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

COPY composer.json composer.lock ./

RUN composer install --no-dev --optimize-autoloader

RUN composer install --no-dev \
 && php artisan key:generate \
 && php artisan config:cache

composer install \
  --no-dev \
  --prefer-dist \
  --optimize-autoloader \
  --no-interaction

```

### 🧩 Step 5: Build Image
```bash
👉 docker build -t <image-name> .
👉 docker build -t <image-name>:<tag-name> .
```

### 🧩 Step 5: Run In Container
```bash
👉 docker run nginx                          # container run
👉 docker run -d --memory="512m" --cpus="1.0" <container-name>
👉 docker run -d --net app-net --name <container-name>
👉 docker run -d --name -p 8080:80 <container-name> <image-name>
👉 docker run -d --name <container-name> -p 8080:80 -v html-website:/var/www/html <image-name>

# Real Production Flow (Laravel Example)

👉 docker build -t laravel-app .
👉 docker run -d \
     --name laravel \
     -p 80:80 \
     -v laravel-storage:/var/www/html/storage \
     --restart always \
     laravel-app

```

### 🧩 Step 5: All Commands
```bash
👉 docker --version
👉 docker info
👉 docker help
👉 docker images                                    # all image list
👉 docker image list                                # all image list
👉 docker ps                                        # all runing container list
👉 docker ps -a                                     # all runing and stoped container list
👉 docker start <container-name-or-id>              # start container
👉 docker stop <container-name-or-id>               # stop container
👉 docker rm <container-name-or-id>                 # delete container
👉 docker rmi <image-name-or-id>                    # delete image
👉 docker exec -it <container-name> bash/sh         # run command in container
👉 docker inspect <image-name>                      # Image Details
👉 docker history <image-name>                      # Show Layer
👉 docker inspect <container-name-or-id>            # Container Details
👉 docker logs <container-name-or-id>               # Container Logs
👉 docker logs -f <container-name-or-id>            # Container Live Logs

# Docker Hub

👉 docker login
👉 docker pull myapp
👉 docker tag myapp sourov/myapp:v1
👉 docker push sourov/myapp:v1

# Docker Compose

👉 docker-compose up -d
👉 docker-compose down
👉 docker-compose ps
👉 docker-compose logs

# Volume Commands

👉 docker volume ls
👉 docker volume create html-website
👉 docker volume inspect html-website
👉 docker volume rm html-website

# Network Commands

👉 docker network ls
👉 docker network create app-net
👉 docker network inspect app-net
👉 docker network rm app-net

| Network Driver  | use case |
| ------- | ----------------------- |
| bridge  | same machine containers |
| host    | direct host network     |
| none    | no network              |
| overlay | multi server cluster    |
| macvlan | real LAN IP             |

# Cleanup Commands (Very Important)

👉 docker system df              # disk usage
👉 docker system prune           # remove unused
👉 docker container prune        # stopped containers
👉 docker image prune            # unused images
👉 docker volume prune           # unused volumes

# Debugging Commands

👉 docker stats                  # live CPU/RAM usage
👉 docker top web                # running process
👉 docker port html-website      # See Running Ports

```























