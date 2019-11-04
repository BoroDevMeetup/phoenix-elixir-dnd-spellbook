defmodule Spellbook.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Spellbook.Repo,
      SpellbookWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: Spellbook.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    SpellbookWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
