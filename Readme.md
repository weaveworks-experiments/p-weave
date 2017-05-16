# Building the Tile
```
docker run -v $(pwd):/work -ti hangar -n weave-cloud -r /work/releases -m /work/metadata/p-weave.yml -c /work/content_migrations/p-weave.yml -g /work/migrations -v 0.0.1 -s 3363
```
