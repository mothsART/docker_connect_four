FROM ubuntu:16.04

RUN apt-get update \
    && apt-get -y install curl git sqlite file clang make

RUN curl -f -L https://static.rust-lang.org/rustup.sh -O
RUN sh rustup.sh -y --channel=nightly --disable-sudo

RUN git clone https://github.com/mothsART/connect_four.git \
   && cd connect_four

CMD cargo run --release --bin web
CMD cargo run --release --bin ws

EXPOSE 8000
