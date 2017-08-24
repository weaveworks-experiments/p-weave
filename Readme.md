# Building the Tile

```
git submodule update --recursive --init
docker run -v $(pwd):/work -ti st3v/p-weave-builder $TILE_VERSION_NUMBER
```

Specify `$TILE_VERSION_NUMBER` as, for example, `0.0.1`.

This builds a tile (`.pivotal` file), which is the artifact which you can upload to ops manager.

# (optional) Building the Tile Builder Docker Image

```
docker build -t $YOUR_DOCKERHUB_USERNAME/p-weave-builder .
docker push $YOUR_DOCKERHUB_USERNAME/p-weave-builder
```

Then substitute `st3v` with `$YOUR_DOCKERHUB_USERNAME` in "Building the Tile" above.
