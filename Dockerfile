FROM rust:1-alpine3.17 as builder

RUN apk --update add openssl g++

WORKDIR /pfpet
COPY . .
RUN cargo build --release

FROM alpine:3.17
COPY --from=builder /pfpet/target/release/pfpet /usr/local/bin/pfpet

ARG DISCORD_TOKEN
ENV DISCORD_TOKEN=$DISCORD_TOKEN

CMD ["/usr/local/bin/pfpet"]
