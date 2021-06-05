# ease
easy serving

## Install

```
# From Docker Hub
docker pull olegkovalov/ease:latest

# or from Github Packages
docker pull ghcr.io/cristaloleg/ease:latest
```

## Usage

In your `Dockerfile` just use in `FROM` directive and `COPY` your assets to `assets` folder.

```
FROM olegkovalov/ease:main

COPY . assets 

EXPOSE 8000

CMD ["./ease.exec"]
```

To quickly run `Dockerfile` use: `docker run -p 8000:8000 -it $(docker build -f Dockerfile -q .)`
