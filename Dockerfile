FROM golang:1.7.3 as builder
RUN go get -d -v github.com/cloudfoundry/bosh-cli
RUN cd /go/src/github.com/cloudfoundry/bosh-cli/ && \
    CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o bosh-cli .

FROM ruby:2.3.4
COPY --from=builder /go/src/github.com/cloudfoundry/bosh-cli/bosh-cli /usr/local/bin/
RUN git clone https://github.com/lukemarsden/hangar /hangar
RUN cd /hangar && gem build hangar.gemspec && gem install hangar-*.gem
ADD ./builder/build.sh /usr/local/bin/build.sh
WORKDIR /work
ENTRYPOINT ["/usr/local/bin/build.sh"]
