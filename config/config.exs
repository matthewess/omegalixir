# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :omegalixir,
  ecto_repos: [Omegalixir.Repo]

# Configures the endpoint
config :omegalixir, OmegalixirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "llBqLvYc1zB3bfxAg3gemBw4BSF5neXlFPpGJV4Q4iz6q/mwT2CHHW1I8+4l4gfv",
  render_errors: [view: OmegalixirWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Omegalixir.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
