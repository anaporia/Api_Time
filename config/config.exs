# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :projet_api,
  ecto_repos: [ProjetApi.Repo]

# Configures the endpoint
config :projet_api, ProjetApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "r/5j8ORnwnck2kXiGuH/GjTDOrAf2ZkNGImwsd/cLdfFaOAFGNl1PFONwsQ78PRy",
  render_errors: [view: ProjetApiWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ProjetApi.PubSub,
  live_view: [signing_salt: "rGMpX3eE"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
