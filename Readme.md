# Building the Tile Builder Docker Image

```
docker build -t $YOUR_DOCKERHUB_USERNAME/p-weave-builder .
docker push $YOUR_DOCKERHUB_USERNAME/p-weave-builder
```

# Building the Tile
```
docker run -v $(pwd):/work -ti lmarsden/p-weave-builder
```
