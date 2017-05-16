FROM ruby:2.3.4

RUN git clone https://github.com/lukemarsden/hangar /hangar
RUN cd /hangar && gem build hangar.gemspec && gem install hangar-*.gem

WORKDIR /work

ENTRYPOINT ["/usr/local/bundle/bin/hangar"]
