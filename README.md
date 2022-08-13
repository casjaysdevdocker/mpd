## 👋 Welcome to mpd 🚀  

Description  
  
  
## Run container

```shell
dockermgr update mpd
```

### via command line

```shell
docker pull casjaysdevdocker/mpd:latest && \
docker run -d \
--restart always \
--name casjaysdevdocker-mpd \
--hostname casjaysdev-mpd \
-e TZ=${TIMEZONE:-America/New_York} \
-v $HOME/.local/share/docker/storage/mpd/mpd/data:/data \
-v $HOME/.local/share/docker/storage/mpd/mpd/config:/config \
-p 80:80 \
casjaysdevdocker/mpd:latest
```

### via docker-compose

```yaml
version: "2"
services:
  mpd:
    image: casjaysdevdocker/mpd
    container_name: mpd
    environment:
      - TZ=America/New_York
      - HOSTNAME=casjaysdev-mpd
    volumes:
      - $HOME/.local/share/docker/storage/mpd/data:/data:z
      - $HOME/.local/share/docker/storage/mpd/config:/config:z
    ports:
      - 80:80
    restart: always
```

## Authors  

🤖 casjay: [Github](https://github.com/casjay) [Docker](https://hub.docker.com/r/casjay) 🤖  
⛵ CasjaysDevdDocker: [Github](https://github.com/casjaysdev) [Docker](https://hub.docker.com/r/casjaysdevdocker) ⛵  
