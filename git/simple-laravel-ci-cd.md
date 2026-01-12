

# Simple Laravel CI/CD Project
```yml
name: Laravel CI/CD Deploy

on:
  push:
    branches:
      - main  # main branch এ push হলে deploy হবে

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Code
        uses: actions/checkout@v3

      - name: Set up PHP
        uses: shivammathur/setup-php@v2
        with:
          php-version: '8.2'
          extensions: mbstring, bcmath, curl, xml, zip
          ini-values: post_max_size=256M, upload_max_filesize=256M
          tools: composer

      - name: Install Dependencies
        run: composer install --no-dev --optimize-autoloader

      - name: Run Tests
        run: php artisan test

      - name: Deploy to Server via SSH
        uses: appleboy/ssh-action@v0.1.7
        with:
          host: ${{ secrets.SERVER_IP }}
          username: ${{ secrets.SERVER_USER }}
          key: ${{ secrets.SERVER_SSH_KEY }}
          port: 22
          script: |
            cd /var/www/your-laravel-project
            git checkout main
            git pull origin main
            composer install --no-dev --optimize-autoloader
            php artisan config:cache
            php artisan route:cache
            php artisan view:cache
            php artisan storage:link
            sudo supervisorctl restart laravel-queue:*
            sudo systemctl reload nginx
            echo "Deployment Complete ✅"

```

