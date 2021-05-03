# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :absinthe_subscriptions,
  ecto_repos: [AbsintheSubscriptions.Repo]

# Configures the endpoint
config :absinthe_subscriptions, AbsintheSubscriptionsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "k3KBGa4haAAAnQccMp1xfvJfDyt3lv22v1PccGlfdnxwlGnMsdEEBmhpxWcWQWBb",
  render_errors: [view: AbsintheSubscriptionsWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: AbsintheSubscriptions.PubSub,
  live_view: [signing_salt: "3K6DVugq"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
