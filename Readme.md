# Building the Tile

```
# prerequisite
go get github.com/cloudfoundry/bosh-cli

# create releases
bosh-cli create-release --dir releases/weave-scope-release --tarball releases/weave-scope.tgz releases/weave-scope-release/releases/weave-scope/weave-scope-0.0.11.yml
bosh-cli create-release --dir releases/runtime-configurator-release --tarball releases/runtime-configurator.tgz releases/runtime-configurator-release/releases/runtime-configurator/runtime-configurator-0.0.1.yml

# create tile
docker run -v $(pwd):/work -ti lmarsden/hangar -n weave-cloud -r /work/releases -m /work/metadata/p-weave.yml -c /work/content_migrations/p-weave.yml -g /work/migrations -v 0.0.1 -s 3363
```
