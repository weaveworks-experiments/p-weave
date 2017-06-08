# Building the Tile

```
git submodule update --recursive --init
docker run -v $(pwd):/work -ti lmarsden/p-weave-builder
```

# (optional) Building the Tile Builder Docker Image

```
docker build -t $YOUR_DOCKERHUB_USERNAME/p-weave-builder .
docker push $YOUR_DOCKERHUB_USERNAME/p-weave-builder
```

Then substitute `lmarsden` with `$YOUR_DOCKERHUB_USERNAME` in "Building the Tile" above.
