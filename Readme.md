# Building the Tile

```
git submodule update --recursive --init
docker run -v $(pwd):/work -ti weaveworks/p-weave-builder $TILE_VERSION_NUMBER
```

Specify `$TILE_VERSION_NUMBER` as, for example, `0.0.1`.

This builds a tile (`.pivotal` file), which is the artifact which you can upload to ops manager.

# (optional) Building the Tile Builder Docker Image

```
docker build -t p-weave-builder .
docker run -v $(pwd):/work -ti weaveworks/p-weave-builder 0.0.1
```

