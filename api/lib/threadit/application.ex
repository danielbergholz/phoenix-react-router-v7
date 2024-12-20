defmodule Threadit.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ThreaditWeb.Telemetry,
      Threadit.Repo,
      {DNSCluster, query: Application.get_env(:threadit, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Threadit.PubSub},
      # Start a worker by calling: Threadit.Worker.start_link(arg)
      # {Threadit.Worker, arg},
      # Start to serve requests, typically the last entry
      ThreaditWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Threadit.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ThreaditWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
