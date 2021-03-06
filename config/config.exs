# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :hydra_ql,
  ecto_repos: [HydraQl.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :hydra_ql, HydraQlWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Yo178RjN4A06g3/0lVreOF2iskxkZfcOojJFJDEWqRox1TTc8RjhDsP7AC0tVgMn",
  render_errors: [view: HydraQlWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: HydraQl.PubSub,
  live_view: [signing_salt: "sZ4IFj09"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :hydra_ql, :mongo_config,
  name: :mongo,
  url: System.get_env("mongo_url"),
  pool_size: 2

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

import_config "kafka.picking.consumer.config.exs"
import_config "poolboy.mongo.config.exs"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
