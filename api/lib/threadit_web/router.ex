defmodule ThreaditWeb.Router do
  use ThreaditWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ThreaditWeb do
    pipe_through :api
  end
end
