defmodule SpellbookWeb.Router do
  use SpellbookWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SpellbookWeb do
    pipe_through :api

    resources "/spells", SpellController, except: [:new, :edit]
  end

  # pipeline :browser do
  #   plug :accepts, ["html"]
  #   plug :fetch_session
  #   plug :fetch_flash
  #   plug :protect_from_forgery
  #   plug :put_secure_browser_headers
  # end

  # scope "/", SpellbookWeb do
  #   pipe_through :browser
  # end
end
