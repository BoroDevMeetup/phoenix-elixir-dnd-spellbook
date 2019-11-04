defmodule SpellbookWeb.Router do
  use SpellbookWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SpellbookWeb do
    pipe_through :api
  end
end
