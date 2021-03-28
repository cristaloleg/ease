# ease
easy serving

## Usage

In your `Dockerfile` just use in `FROM` directive and `COPY` your assets to `assets` folder.

```
FROM olegkovalov/ease:main

COPY . assets 

EXPOSE 8000

CMD ["./ease.exec"]
```

To quickly run `Dockerfile` use: `docker run -p 8000:8000 -it $(docker build -f Dockerfile -q .)`
