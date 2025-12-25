# 2. Frontend: Blade, Tailwind & Alpine.js

The application focuses heavily on reusable Blade Components to keep the views clean.

## Setup

We use **Vite** for asset bundling and **Tailwind CSS** for styling.

```bash
docker-compose run --rm --service-ports -w /var/www/html/app npm install -D @tailwindcss/forms
docker-compose run --rm --service-ports -w /var/www/html/app npm install alpinejs
```

## Blade Components

We utilize anonymous blade components for UI consistency.

| Component   | Command                                  | Description                                                   |
|-------------|------------------------------------------|---------------------------------------------------------------|
| Layout      | `php artisan make:component Layout`      | Base HTML structure, includes Vite assets.                    |
| Card        | `php artisan make:component Card`        | Standard white box with shadow/border.                        
| JobCard     | `php artisan make:component JobCard`     | Specialized card displaying Job metadata (Salary, Tags).      
| Tag         | `php artisan make:component Tag`         | Small pills for Experience/Category.                          
| LinkButton  | `php artisan make:component LinkButton`   | Standardized anchor tag styled as a button.                   
| Breadcrumbs | `php artisan make:component Breadcrumbs` | Navigation helper.                                            
| TextInput   | `php artisan make:component TextInput`   | Wrapper for input fields with error handling & reset buttons. 
| RadioGroup  | `php artisan make:component RadioGroup`	 | Generates radio lists dynamically from arrays.                