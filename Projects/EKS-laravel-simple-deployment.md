# EKS - Simple Laravel Project Deployment

### Create Dockerfile

`Dockerfile`

```dockerfile
FROM php:8.4-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    zip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y supervisor

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


# Set working directory
WORKDIR /var/www

# Copy project files

COPY . .

# Create .env file if it doesn't exist
RUN if [ ! -f .env ]; then cp .env.example .env || echo "No .env.example found"; fi

# Install dependencies with scripts disabled
RUN php /usr/local/bin/composer install --optimize-autoloader --no-scripts

# Generate key and run post-install scripts
RUN php artisan key:generate --force || true
RUN php /usr/local/bin/composer run-script post-autoload-dump || true

# Set permissions
RUN chown -R www-data:www-data /var/www \
    && chmod -R 755 /var/www/storage \
    && chmod -R 755 /var/www/bootstrap/cache

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 8000

CMD ["/usr/bin/supervisord"]
```

### Create supervisord config

`supervisord.conf`

```conf
[supervisord]
nodaemon=true
user=root

; ===============================
; Laravel Serve
; ===============================
[program:laravel-serve]
command=php artisan serve --host=0.0.0.0 --port=8000
directory=/var/www
autostart=true
autorestart=true
stdout_logfile=/var/www/storage/logs/serve.log
redirect_stderr=true

; ===============================
; Laravel Queue Worker
; ===============================
[program:laravel-queue]
command=php artisan queue:work --sleep=30 --tries=3 --timeout=90
directory=/var/www
autostart=true
autorestart=true
numprocs=1
process_name=%(program_name)s_%(process_num)02d
stdout_logfile=/var/www/storage/logs/queue.log
redirect_stderr=true
stopwaitsecs=3600

```

### Create Deployment
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: laravel-deployment
  namespace: default
  labels:
    app: laravel-backend
spec:
  replicas: 2
  selector:
    matchLabels:
      app: laravel-backend
  template:
    metadata:
      labels:
        app: laravel-backend
    spec:
      containers:
        - name: laravel-backend
          image: 1234567890123.dkr.ecr.ap-southeast-1.amazonaws.com/projects/backend:latest
          imagePullPolicy: Always
          ports:
            - containerPort: 8000
          resources:
            requests:
              cpu: "250m"      # Pod scheduling এর জন্য minimum CPU
              memory: "512Mi"  # Pod scheduling এর জন্য minimum Memory
            limits:
              cpu: "500m"      # Maximum CPU ব্যবহার
              memory: "1Gi"    # Maximum Memory ব্যবহার
```

### Create Service - Load Balancer

`service-load-balancer.yaml`

```yaml
apiVersion: v1
kind: Service
metadata:
  name: laravel-backend-alb
  annotations:
    service.beta.kubernetes.io/aws-load-balancer-type: "nlb"
    service.beta.kubernetes.io/aws-load-balancer-scheme: "internet-facing"
    service.beta.kubernetes.io/aws-load-balancer-subnets: "subnet-07920acc8bd99a123,subnet-07ad9e9f185ed8975"
    service.beta.kubernetes.io/aws-load-balancer-internal: "false"  # Internet-facing
spec:
  type: LoadBalancer
  selector:
    app: laravel-backend
  ports:
    - protocol: TCP
      port: 80
      targetPort: 8000
```


