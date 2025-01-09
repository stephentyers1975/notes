# Docker Compose
## bring up containers
`docker compose up`
## example file
```
version: 2
services:
     redis:
         image: redis
networks:
    - back-end
db:
    image: postgres:9.4
         networks:
             - back-end
      vote:
          image: voting-app
         networks:
             - front-end
- back-end
      result:
          image: result
networks:
- front-end
- back-end
networks:
    front-end:
back-end:
```

```
version: '3.0'
services:
  redis:
    image: redis:alpine
  clickcounter:
    image: kodekloud/click-counter
    ports:
    - 8085:5000
```