FROM elixir:latest
MAINTAINER Matthew Caldwell <caldwellysr@gmail.com>

WORKDIR /code

RUN mix local.rebar --force
RUN mix local.hex --force
RUN apt-get update && apt-get install -y inotify-tools

EXPOSE 4000

CMD mix deps.get && mix phx.server
