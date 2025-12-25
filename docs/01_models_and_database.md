# 1. Models, Factories, and Migrations

This section covers the database architecture and data generation.

## Models Created

We utilize standard Laravel commands to generate the Model, Migration (`-m`), and Factory (`-f`) simultaneously.
### Command
```bash
php artisan make:model ModelName -m -f
```

### Command in Our Project
```bash
docker-compose exec php_fpm php /var/www/html/app/artisan make:model Job -m -f
docker-compose exec php_fpm php /var/www/html/app/artisan make:model Employer -m -f
docker-compose exec php_fpm php /var/www/html/app/artisan make:model JobApplication -m -f
```

## Database Schema Overview
### Jobs Table
Contains the core job listing data.
- **Relationships**: Belongs to `Employer`, Has Many `JobApplication`.
- **Soft Deletes**: Enabled to allow restoring deleted jobs.

### Employers Table
Represents companies posting jobs.
- **Relationships**: Belongs to `User` (Recruiter), Has Many `Jobs`.

### Job Applications Table
Links a User to a Job with specific metadata.
- Fields: `expected_salary`, `cv_path`.
- Relationships: Belongs to `User`, Belongs to `Job`.

## Seeding Strategy
The `DatabaseSeeder` handles complex relationships to ensure realistic dummy data:

1. Creates 300 Users.
2. Shuffles users and assigns 20 of them as Employers. 
3. Creates 100 Jobs assigned to random Employers. 
4. Simulates Job Applications by randomly linking Users to Jobs.

### Command to reset and seed:
```bash
## Command
php artisan migrate:refresh --seed

## Command We Use
docker-compose exec php_fpm php /var/www/html/app/artisan migrate:refresh --seed
```