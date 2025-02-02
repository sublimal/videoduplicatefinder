Dockerised version of [Video Duplicate Finder](https://github.com/0x90d/videoduplicatefinder).

# TrueNAS install
Add [docker-compose.yaml](docker-compose.yaml) as custom app via [TrueNAS Custom App yaml](https://www.truenas.com/docs/truenasapps/usingcustomapp/#installing-via-yaml), mapping container `volumes` where appropriate.

App will be available via browser on [configured port](https://github.com/linuxserver/docker-baseimage-kasmvnc#options), default http://ip:3000/
