defmodule AbsintheSubscriptions.Repo do
  use Ecto.Repo,
    otp_app: :absinthe_subscriptions,
    adapter: Ecto.Adapters.Postgres
end
