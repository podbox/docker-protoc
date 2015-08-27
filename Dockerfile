FROM podbox/debian

# ----------------------------------------------------------------------- protoc
ENV PROTOBUF_VERSION 3.0.0-beta-1

RUN apt-get update && apt-get install -yq dh-autoreconf make gcc \

 && (curl -L https://github.com/google/protobuf/archive/v$PROTOBUF_VERSION.tar.gz | gunzip -c | tar x) \
 && cd protobuf-$PROTOBUF_VERSION \
 && ./autogen.sh \
 && ./configure  \
 && make install \
 && cd .. \

 && apt-get autoremove -y dh-autoreconf make gcc \
 && apt-get clean purge \
 && rm -fR /var/cache/apt/archives/*.deb /tmp/* /protobuf-*

ENTRYPOINT ["protoc"]
CMD ["--help"]
