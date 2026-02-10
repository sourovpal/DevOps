## 🔹 Core Docker Concepts (Must Know)

1. **Docker Architecture**

   * Docker Engine
   * Docker Daemon
   * Docker CLI
   * Docker Client–Server model

2. **Docker Image**

   * Base image
   * Image layers
   * Image tagging & versioning
   * Image optimization (small image)

3. **Docker Container**

   * Lifecycle (create, start, stop, restart, remove)
   * Detached vs Interactive
   * Container logs
   * Exec into container

---

## 🔹 Build & Configuration

4. **Dockerfile**

   * FROM, RUN, CMD, ENTRYPOINT
   * COPY vs ADD
   * ENV, ARG
   * WORKDIR, EXPOSE
   * Multi-stage build ⭐

5. **Docker Ignore**

   * `.dockerignore`
   * Why and how to use

---

## 🔹 Networking

6. **Docker Network**

   * Bridge network (default)
   * Host network
   * None network
   * Custom bridge network
   * Container-to-container communication
   * Port mapping (`-p 80:80`)

---

## 🔹 Data Persistence

7. **Docker Volume**

   * Named volume
   * Anonymous volume
   * Volume lifecycle

8. **Bind Mount**

   * Host ↔ Container file sync
   * Dev vs Prod use case

---

## 🔹 Orchestration & Multi-Container

9. **Docker Compose** ⭐⭐

   * `docker-compose.yml`
   * Multiple services (API, DB, Redis)
   * Environment variables
   * Depends_on
   * Scaling services

---

## 🔹 Registry & Image Sharing

10. **Docker Registry**

* Docker Hub
* Private Registry
* Push / Pull image
* Image version strategy

---

## 🔹 Security & Optimization

11. **Docker Security**

* Non-root user
* Secrets & env security
* Image vulnerability basics

12. **Docker Resource Management**

* CPU limit
* Memory limit
* Container monitoring

---

## 🔹 Logs & Debugging

13. **Docker Logs & Monitoring**

* `docker logs`
* Inspect container
* Healthcheck

---

## 🔹 Advanced / Production Topics

14. **Docker Swarm (Basic)**

* Manager & Worker
* Service & scaling

15. **Docker with CI/CD**

* GitHub Actions
* GitLab CI
* Auto build & deploy

16. **Docker + Cloud**

* Docker with AWS ECS
* Docker with EKS
* Docker with Nginx reverse proxy

---

## 🔹 Bonus (Industry Use)

17. **Best Practices**

* One process per container
* Small images
* Layer caching
* Proper tagging

18. **Docker vs VM**

* Container vs Virtual Machine
* When to use Docker
