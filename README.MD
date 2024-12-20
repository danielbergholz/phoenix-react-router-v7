# Threadit

Lightweight, Reddit-inspired app powered by a [Phoenix](https://www.phoenixframework.org) REST API and a [React Router v7](https://reactrouter.com) frontend.

## Running the backend

- Change directory to `./api`
- Install [Elixir and Erlang](https://elixir-lang.org/install.html)
  - I recommend using [asdf](https://asdf-vm.com/) to manage your Elixir and Erlang versions
  - Simply run `asdf install` in the project root to install the correct versions
- Install [Postgres](https://www.postgresql.org/download/) (I recommend using [Postgres.app](https://postgresapp.com/) on macOS)
- Run `mix setup` to install dependencies and seed the database
- Start the Phoenix server with `mix phx.server` or inside IEx with `iex -S mix phx.server`
- Now you can visit [`localhost:4000`](http://localhost:4000) from your browser
