FROM golang:1.7.3 as builder
RUN go get -d -v github.com/cloudfoundry/bosh-cli
RUN go install github.com/cloudfoundry/bosh-cli

FROM ruby:2.3.4
COPY --from=builder /go/bin/bosh-cli /usr/local/bin/
RUN git clone https://github.com/concourse/hangar /hangar
RUN cd /hangar && gem build hangar.gemspec && gem install hangar-*.gem
ADD ./builder/build.sh /usr/local/bin/build.sh
WORKDIR /work
ENTRYPOINT ["/usr/local/bin/build.sh"]
