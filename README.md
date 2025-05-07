# WordPress Deployment with Docker Compose

## Table of Contents
1. [Overview](#overview)
2. [Project Structure](#project-structure)
3. [Setup and Installation](#setup-and-installation)
4. [Using Docker Compose](#using-docker-compose)
5. [Bonus Services](#bonus-services)
6. [Conclusion](#conclusion)

---

## Overview
This project sets up a containerized WordPress environment by orchestrating multiple services using Docker Compose. The main components include:
- **Nginx** as the reverse proxy and web server.
- **MariaDB** as the database backend.
- **WordPress** as the content management system.

In addition, bonus services are provided to extend functionality:
- **Adminer** and **phpMyAdmin** for database management.
- **Redis** for caching.
- A **Custom Static Website** for additional content delivery.

<img width="632" alt="inception" src="https://github.com/user-attachments/assets/2a86d40a-6a64-4b7c-a311-3627014eea06" />

---

## Project Structure
```
.
├── Makefile
├── init_docker.sh            # Script to initialize Docker (especially on macOS)
├── srcs
│   ├── docker-compose.yml    # Docker Compose file orchestrating all services
│   ├── .env                  # Environment variables for service configuration
│   ├── requirements
│   │   ├── mariadb         # Contains Dockerfile, .dockerignore, configuration files and tools for MariaDB
│   │   ├── nginx           # Contains Dockerfile, .dockerignore, configuration files and tools for Nginx
│   │   ├── wordpress       # Contains Dockerfile, .dockerignore, configuration files and tools for WordPress
│   ├── bonus                # Optional bonus services
│       ├── adminer         # Contains Dockerfile for Adminer
│       ├── phpmyadmin      # Contains Dockerfile for phpMyAdmin
│       ├── redis           # Contains Dockerfile for Redis
│       └── static-site     # Contains Dockerfile for a custom static website
└── README.md
```

Each service is defined in its own directory with a custom Dockerfile. This modular structure makes it easier to manage and update each component independently.

---

## Setup and Installation

### Prerequisites
- Docker and Docker Compose installed on your system.
- A Unix-based environment (or virtual machine) configured with the proper permissions.

### Initializing Docker
Before starting the project, run the `init_docker.sh` script to ensure Docker is correctly installed and configured (this is particularly useful on macOS):
```sh
./init_docker.sh
```
This script sets up the Docker environment by configuring necessary directories and symlinks.

### Starting the Application
1. **Clone the Repository**
   ```sh
   git clone https://github.com/Poider//Inception-Dockerized-Solutions.git
   cd Inception-Dockerized-Solutions/srcs
   ```

2. **Configure Environment Variables**
   Edit the `.env` file to set your database credentials and any other configuration variables:
   ```ini
   MYSQL_DATABASE=wordpress
   MYSQL_USER=admin
   MYSQL_PASSWORD=secret
   MYSQL_ROOT_PASSWORD=rootsecret
   DOMAIN_NAME=mel-amma.42.fr
   ```

3. **Build and Start Containers**
   Use Docker Compose to build and run the containers:
   ```sh
   docker-compose up -d --build
   ```
   This command builds custom images for each service and starts the containers in detached mode.

4. **Access the Services**
   - **WordPress**: [http://localhost](http://localhost)
   - **phpMyAdmin**: [http://localhost:9092](http://localhost:9092)
   - **Adminer**: [http://localhost:9093](http://localhost:9093)
   - **Static Website**: [http://localhost:9090](http://localhost:9090)

5. **Stopping the Application**
   To stop and remove containers (with volumes):
   ```sh
   docker-compose down --volumes
   ```

---

## Using Docker Compose
The `docker-compose.yml` file in the `srcs` directory is used to orchestrate all the services, ensuring that they run on a dedicated network and have access to persistent volumes. The file defines dependencies (for example, WordPress depends on MariaDB and Redis), automatic restarts, and service-specific configurations. This approach keeps the setup modular and manageable, making it straightforward to add or update services.

---

## Bonus Services
The bonus directory includes additional services that extend the functionality of the main application:
- **Adminer**: A lightweight database management tool.
- **phpMyAdmin**: Another graphical tool for managing MariaDB.
- **Redis**: An in-memory data structure store used for caching.
- **Custom Static Website**: A simple site that can be used for additional content or as a landing page.

These services are integrated using Docker Compose, providing a comprehensive multi-service environment.

---

## Conclusion
This project sets up a complete, containerized WordPress environment using Docker Compose. It includes a well-organized structure with separate services for Nginx, MariaDB, and WordPress, along with bonus services to provide additional management and caching capabilities. This modular setup allows for efficient service orchestration, data persistence, and ease of deployment.

**Author:** [poider](https://github.com/poider)
