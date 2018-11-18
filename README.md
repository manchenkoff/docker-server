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
      - ./src:/var/www
      
      # See volumes description below
```

### Volumes

Supervisor tasks
- ```/etc/supervisor/conf.d/...``` -> **worker.default.conf**

Apache virtual hosts config
- ```/etc/apache2/sites-enabled/...``` -> **default.conf**

Web directory
- ```/var/www``` -> **/src** directory
