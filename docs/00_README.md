# Laravel Job Board

A Job Board application built with **Laravel 12**, featuring a modern UI with **Tailwind CSS** and **Alpine.js**. This application supports job posting, filtering, application management, and role-based access control (Employer vs. User).

## 🛠 Tech Stack

- **Framework:** Laravel 12
- **Styling:** Tailwind CSS + Tailwind Forms Plugin
- **Interactivity:** Alpine.js
- **Database:** PostgreSQL
- **Icons:** Heroicons

### 1. Clone and Install Dependencies

```bash
# Install PHP dependencies
docker-compose run --rm -w /var/www/html composer install

# Install Node dependencies
docker-compose run --rm --service-ports -w /var/www/html/app npm install
```