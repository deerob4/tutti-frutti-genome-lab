defmodule Gardener.Router do
  use Gardener.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Gardener do
    pipe_through :browser # Use the default browser stack

    get "/", GardenController, :index
    get "/grow", GardenController, :generate
  end

  # Other scopes may use custom stacks.
  # scope "/api", Gardener do
  #   pipe_through :api
  # end
end
