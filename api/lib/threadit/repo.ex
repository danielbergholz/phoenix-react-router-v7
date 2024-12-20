defmodule Threadit.Repo do
  use Ecto.Repo,
    otp_app: :threadit,
    adapter: Ecto.Adapters.Postgres
end
