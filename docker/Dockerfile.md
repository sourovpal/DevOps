# Write Dockerfile for Project

### 🧩 Step 1: Base Image declaration
```bash
FROM nginx:alpine
FROM httpd:alpine
FROM php:8.2-alpine
FROM node:18-alpine
FROM openjdk:17-alpine
FROM mcr.microsoft.com/dotnet/aspnet:8.0
```
### 🧩 Step 2: Copy Project Local Computer to Docker Image
```bash
WORKDIR /app

# COPY <source> <destination>
COPY . .
```
📌 যদি /app না থাকে → Docker নিজে তৈরি করে নেয়
