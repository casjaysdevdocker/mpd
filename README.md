## 👋 Welcome to mpd 🚀  

mpd README  
  
  
## Install my system scripts  

```shell
 sudo bash -c "$(curl -q -LSsf "https://github.com/systemmgr/installer/raw/main/install.sh")"
 sudo systemmgr --config && sudo systemmgr install scripts  
```
  
## Automatic install/update  
  
```shell
dockermgr update mpd
```
  
## Install and run container
  
```shell
dockerHome="/var/lib/srv/$USER/docker/casjaysdevdocker/mpd/mpd/latest/rootfs"
mkdir -p "/var/lib/srv/$USER/docker/mpd/rootfs"
git clone "https://github.com/dockermgr/mpd" "$HOME/.local/share/CasjaysDev/dockermgr/mpd"
cp -Rfva "$HOME/.local/share/CasjaysDev/dockermgr/mpd/rootfs/." "$dockerHome/"
docker run -d \
--restart always \
--privileged \
--name casjaysdevdocker-mpd-latest \
--hostname mpd \
-e TZ=${TIMEZONE:-America/New_York} \
-v "$dockerHome/data:/data:z" \
-v "$dockerHome/config:/config:z" \
-p 80:80 \
casjaysdevdocker/mpd:latest
```
  
## via docker-compose  
  
```yaml
version: "2"
services:
  ProjectName:
    image: casjaysdevdocker/mpd
    container_name: casjaysdevdocker-mpd
    environment:
      - TZ=America/New_York
      - HOSTNAME=mpd
    volumes:
      - "/var/lib/srv/$USER/docker/casjaysdevdocker/mpd/mpd/latest/rootfs/data:/data:z"
      - "/var/lib/srv/$USER/docker/casjaysdevdocker/mpd/mpd/latest/rootfs/config:/config:z"
    ports:
      - 80:80
    restart: always
```
  
## Get source files  
  
```shell
dockermgr download src casjaysdevdocker/mpd
```
  
OR
  
```shell
git clone "https://github.com/casjaysdevdocker/mpd" "$HOME/Projects/github/casjaysdevdocker/mpd"
```
  
## Build container  
  
```shell
cd "$HOME/Projects/github/casjaysdevdocker/mpd"
buildx 
```
  
## Authors  
  
🤖 casjay: [Github](https://github.com/casjay) 🤖  
⛵ casjaysdevdocker: [Github](https://github.com/casjaysdevdocker) [Docker](https://hub.docker.com/u/casjaysdevdocker) ⛵  
