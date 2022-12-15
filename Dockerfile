FROM rust:latest as builder

WORKDIR /pfpet
COPY . .
RUN cargo build --release

FROM debian:buster-slim
RUN apt-get update
COPY --from=builder /pfpet/target/release/pfpet /usr/local/bin/pfpet

ARG DISCORD_TOKEN
ENV DISCORD_TOKEN=$DISCORD_TOKEN

CMD ["/usr/local/bin/pfpet"]
