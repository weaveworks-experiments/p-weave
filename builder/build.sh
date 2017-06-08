#!/bin/bash -xe

# create releases
bosh-cli create-release --dir releases/weave-scope-release --tarball releases/weave-scope.tgz releases/weave-scope-release/releases/weave-scope/weave-scope-0.0.12.yml
bosh-cli create-release --dir releases/runtime-configurator-release --tarball releases/runtime-configurator.tgz releases/runtime-configurator-release/releases/runtime-configurator/runtime-configurator-0.0.1.yml
bosh-cli create-release --dir releases/uaa-proxy-release --tarball releases/uaa-proxy.tgz releases/uaa-proxy-release/releases/uaa-proxy/uaa-proxy-0.0.2.yml

# download releases
wget -O releases/cf-routing.tgz https://bosh.io/d/github.com/cloudfoundry-incubator/cf-routing-release?v=0.156.0
wget -O releases/consul.tgz https://bosh.io/d/github.com/cloudfoundry-incubator/consul-release?v=170

# create tile
/usr/local/bundle/bin/hangar -n weave-cloud -r /work/releases -m /work/metadata/p-weave.yml -c /work/content_migrations/p-weave.yml -g /work/migrations -v 0.0.1 -s 3363
