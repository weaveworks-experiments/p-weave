#!/bin/bash -xe
if [ "$1" = "" ]; then
    echo "Please specify a version number (e.g. 0.0.1) as the first argument"
    exit 1
fi

# create releases

latest_scope=$(ls releases/weave-scope-release/releases/weave-scope/ |sort --version-sort --field-separator=- --key=3,3 |tail -n 1)
bosh-cli create-release --dir releases/weave-scope-release --tarball releases/weave-scope.tgz \
    releases/weave-scope-release/releases/weave-scope/$latest_scope

# download releases
curl -sSL -o releases/prometheus.tgz "https://github.com/cloudfoundry-community/prometheus-boshrelease/releases/download/v18.0.0/prometheus-18.0.0.tgz"

# create tile
/usr/local/bundle/bin/hangar -n weave-cloud -r /work/releases -m /work/metadata/p-weave.yml -c /work/content_migrations/p-weave.yml -g /work/migrations/v1 -v $1 -s 3468
