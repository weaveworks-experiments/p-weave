FROM ubuntu:16.04
RUN apt update && \
    apt install -y python-pip rubygems && \
    pip install tile-generator && \
    gem install bosh_cli --no-ri --no-rdoc
WORKDIR /work
ENTRYPOINT ["/usr/local/bin/tile"]
