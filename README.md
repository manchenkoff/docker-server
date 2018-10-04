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
    ports:
      # Apache ports
      - 80:80
      - 443:443
    volumes:
      - ./src:/var/www
      # See volumes description below
```

### Volumes

Additional PHP config
- ```/etc/php/7.2/cli/conf.d/project.ini```

Supervisor tasks
- ```/etc/supervisor/conf.d/default.conf```

Apache virtual host config
- ```/etc/apache2/sites-enabled/host.conf```

Web directory
- ```/var/www```