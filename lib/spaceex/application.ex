defmodule Spaceex.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Spaceex.Repo,
      # Start the Telemetry supervisor
      SpaceexWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Spaceex.PubSub},
      # Start the Endpoint (http/https)
      SpaceexWeb.Endpoint,
      # Start a worker by calling: Spaceex.Worker.start_link(arg)
      # {Spaceex.Worker, arg}
      Spaceex.Scheduler
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Spaceex.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SpaceexWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
