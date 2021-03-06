defmodule AbsintheSubscriptions.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      AbsintheSubscriptions.Repo,
      # Start the Telemetry supervisor
      AbsintheSubscriptionsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: AbsintheSubscriptions.PubSub},
      # Start the Endpoint (http/https)
      AbsintheSubscriptionsWeb.Endpoint,
      {Absinthe.Subscription, AbsintheSubscriptionsWeb.Endpoint}
      # Start a worker by calling: AbsintheSubscriptions.Worker.start_link(arg)
      # {AbsintheSubscriptions.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AbsintheSubscriptions.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    AbsintheSubscriptionsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
