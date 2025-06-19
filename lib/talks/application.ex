defmodule Talks.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TalksWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:talks, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Talks.PubSub},
      # Start a worker by calling: Talks.Worker.start_link(arg)
      # {Talks.Worker, arg},
      # Start to serve requests, typically the last entry
      TalksWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Talks.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TalksWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
