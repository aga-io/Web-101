# WEB PROGRAMMING

## Local Web Development Environment with Docker

This repository provides a flexible, container-based local development environment using Docker Compose. It's designed
to replace tools like XAMPP, offering Nginx, PHP-FPM, Redis, and your choice of either MySQL or PostgreSQL for your
projects.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- **Docker Engine**
- **Docker Compose**
- **Git**

*For Windows users, it is highly recommended to use Docker Desktop with the WSL2 backend for the best performance.*

## 🚀 Getting Started

Setting up your environment is straightforward.

1. **Clone the Repository**

   First, clone this repository to your local machine.
    ```bash
   git clone <your-repository-url>
   cd <repository-folder>
    ```
2. **Configure Your Environment**

   The entire setup is controlled by an environment file.
    - Open the `.env` file and choose your database by setting the `DB` variable to either `mysql` or `postgres`.
        ```dotenv
        # Choose your database by setting DB to 'mysql' or 'postgres'
        DB=postgres

        # This line automatically loads the correct docker-compose file. Do not change it.
        COMPOSE_FILE=docker-compose.yml:docker-compose.${DB}.yml
    
        # --- Project & Database Credentials ---
        PROJECT_DIR=/var/www/html/
    
        MYSQL_DATABASE=local_db
        MYSQL_USER=user
        MYSQL_PASSWORD=password
        MYSQL_ROOT_PASSWORD=root
    
        POSTGRES_DB=local_db
        POSTGRES_USER=user
        POSTGRES_PASSWORD=password
        ```
3. **Place Your Project Files**

   Add your web application's code into the `./www` directory. This folder is synced with the Nginx and PHP containers.

## 🏗️ Installing Laravel

Follow these steps to install a fresh Laravel project into this environment.

### 1. Create the Project
Install Laravel into a subdirectory named `app` using the specific working directory flag.
```bash
docker-compose run --rm -w /var/www/html composer create-project laravel/laravel app
```

### 2. Update Nginx Configuration
Point the web server to Laravel's public folder.
1. Open `nginx/default.conf`.
2. Update the `root` directive:
   ```nginx
   root /var/www/html/app/public;
   ```
3. Restart `nginx` to apply changes:
   ```bash
   docker-compose restart nginx
   ```

### 3. Set Permissions
Grant the web server permission to write to Laravel's storage directories.
```bash
docker-compose exec php_fpm chown -R www-data:www-data /var/www/html/app/storage /var/www/html/app/bootstrap/cache
```

### 4. Run Migrations
Update your Laravel `.env` with the Docker service credentials, then run the migration:
```bash
docker-compose exec php_fpm php /var/www/html/app/artisan migrate
```

## ⚙️ Usage

All commands should be run from the root of the project directory.

### Starting the Environment

This command builds the images (if they don't exist) and starts all the necessary containers in the background.

```bash
docker-compose up -d --build
```

### Stopping the Environment

This command stops the running containers without removing them. Your data will remain safe.

```bash
docker-compose stop
```

### Stopping and Removing Containers

This command stops all containers and removes them. Your data stored in the database volumes will be safe.

```bash
docker-compose down
```

### Stopping and Deleting Everything

⚠️ **Warning**: This command stops and removes the containers AND deletes all database volumes (`redis`, `mysql`,
`postgres`). Use this only when you want to start completely fresh.

```bash
docker-compose down -v
```

## 🛠️ Running Utility Commands

This setup includes utility containers for running `npm` and `composer` commands without needing to install them on your
host machine.

### Composer

To run a Composer command (e.g., `install`), use the `-w` flag to specify your project's working directory.

```bash
# Example for a project located in ./www/my-laravel-app
docker-compose run --rm -w /var/www/html/my-laravel-app composer install
```

### NPM

Similarly, run npm commands inside your project's front-end directory.

```bash
# Example for a project located in ./www/my-react-app
docker-compose run --rm -w /var/www/html/my-react-app npm install
```

## 🔌 Service Connection Details

Here are the default credentials to connect to the services from your application. The hostname is the name of the
service defined in `docker-compose.yml`.

| Service    | Hostname   | Port | Username   | Password   | Database   |
|------------|------------|------|------------|------------|------------|
| MySQL      | `mysql`    | 3306 | `admin`    | `admin`    | `local_db` |
| PostgreSQL | `postgres` | 5432 | `postgres` | `postgres` | `local_db` |
| Redis      | `redis`    | 6379 | -          | -          | -          |

Notes:
```bash
docker-compose run --rm -w /var/www/html composer create-project laravel/laravel app

root /var/www/html/app/public;
docker-compose restart nginx

docker-compose exec php_fpm chown -R www-data:www-data /var/www/html/app/storage /var/www/html/app/bootstrap/cache

docker-compose exec php_fpm php /var/www/html/app/artisan migrate
```