use Mix.Config

config :spellbook,
  ecto_repos: [Spellbook.Repo]

config :spellbook, SpellbookWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dYpZK1Czv/rhdCXRrqTG6HVHI/enC8gJtI0jMsX8NKL6LQ3cdEvZQUvSOkBUPngs",
  render_errors: [view: SpellbookWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Spellbook.PubSub, adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"
