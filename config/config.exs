# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :bioskop,
  ecto_repos: [Bioskop.Repo]

# Configures the endpoint
config :bioskop, BioskopWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "RE5oba69pY9IxirBzIwZUlKluUZ/B+5BURM5E0HQmNYS9obO0nHAWFCIhHXhOgru",
  render_errors: [view: BioskopWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Bioskop.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
