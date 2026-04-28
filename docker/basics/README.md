# Docker Basics

## Image vs Container
- Image = pre-packaged template (the lunch box)
- Container = running instance of that image (the opened lunch box)

## run -it vs run -d vs exec -it
- `docker run -it` → creates new container + enters it → exits when you leave
- `docker run -d` → starts container in background → stays running
- `docker exec -it` → enters already running container → stays running when you leave

## Getting Container IP
```bash
# Old way (often empty)
docker inspect --format '{{ .NetworkSettings.IPAddress }}' <name>

# Correct way
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <name>
```

## Networking
- Default bridge: containers can communicate but name resolution is unreliable
- Custom network (best practice):
```bash
docker network create my-net
docker run -d --name web1 --network my-net nginx
docker run -d --name web2 --network my-net nginx
docker exec -it web1 curl http://web2
