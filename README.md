## An arm64 docker image for the [Polaris](https://github.com/ogarcia/docker-polaris) music server made by drifty

Polaris is a self-hosted music streaming server, to enjoy your music collection from any computer or mobile device.

The official images for arm64 do not exist and require building everytime, and I needed one for my Pi, so I cloned the repo and built the image myself. Useful for anyone with an arm64 processor who wants to run the engine. 

Also available on Dockerhub - [```driftywinds/polaris:latest```](https://hub.docker.com/repository/docker/driftywinds/polaris/)

How to use: - 

1. Use the docker or docker compose template from the official repo.
3. Change the "image" part of the docker-compose.yml to ```driftywinds/polaris:latest```.

<br>

You can check logs live with this command: - 
```
docker logs -f <container name>
```
