# Weave Cloud Pivotal Cloud Foundry Tile

[![Build Status](https://travis-ci.org/weaveworks-experiments/p-weave.svg?branch=master)](https://travis-ci.org/weaveworks-experiments/p-weave)

Components:

* Cortex agent (Bosh, CF and Firehouse Prometheus exporters)
* Scope probe (Bosh & Garden Container Runtime plugins)

Explore hosts view

![hosts](https://raw.githubusercontent.com/weaveworks-experiments/p-weave/master/docs/images/hosts.png)

Explore processes view

![procs](https://raw.githubusercontent.com/weaveworks-experiments/p-weave/master/docs/images/procs.png)

Monitor Bosh metrics graphs view

![metrics](https://raw.githubusercontent.com/weaveworks-experiments/p-weave/master/docs/images/metrics.png)

### Building the Tile

```
git submodule update --recursive --init
docker run -v $(pwd):/work -ti weaveworks/p-weave-builder $TILE_VERSION_NUMBER
```

Specify `$TILE_VERSION_NUMBER` as, for example, `0.0.1`.

This builds a tile (`.pivotal` file), which is the artifact which you can upload to ops manager.

Building the tile builder Docker image locally:

```
docker build -t p-weave-builder .
docker run -v $(pwd):/work -ti p-weave-builder 0.0.1
```

