# Development web server

### Includes
- Apache 2
- Supervisor
- PHP 7.2 (Composer, GD, Imagick, etc)
- Extensions: PDO MySQL & Postgres, SQLite, Memcached, Redis, Xdebug, Apc, Opcache
- Python 3
- Perl 5
- NodeJS, npm
- Git

### Usage

Example ***docker-compose.yml*** config below

```
version: '3'
services:
  server:
    container_name: server_www
    image: manchenkoff/server
    build:
      context: ./
      dockerfile: ./docker/Dockerfile
    ports:
      - 80:80
      - 443:443
    environment:
      XDEBUG_CONFIG: remote_host=host.docker.internal
      PHP_IDE_CONFIG: serverName=localhost
    volumes:
      - ./:/var/www
      
      # See volumes description below
```

### Volumes

Supervisor tasks
- `/etc/supervisor/conf.d/` -> `./docker/conf/supervisor/`

Apache virtual hosts config
- `/etc/apache2/sites-enabled/` -> `./docker/conf/apache/hosts/`

Apache SSL certificate
- `/etc/apache2/ssl/` -> `./docker/conf/apache/certs/`

Web directory
- `/var/www` -> current project directory `./`

### Apache SSL

If you want to use HTTPS with Apache, please generate and mount (docker volumes) the certificate file by executing the following command

```bash
openssl req -new -newkey rsa:4096 -days 3650 -nodes -x509 -subj \
"/C=RU/ST=Moscow-State/L=Moscow/O=Manchenkov/CN=project.local" \
-keyout ./docker/conf/apache/certs/ssl.key -out ./docker/conf/apache/certs/ssl.crt
```

C=Country code (2 characters)
ST=State province
L=Locality
O=Organization name
CN=FQDN or Name