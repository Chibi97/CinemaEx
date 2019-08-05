defmodule BioskopWeb.Router do
  use BioskopWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BioskopWeb do
    pipe_through :api

    resources "/movies", MovieController, except: [:new, :edit]
  end
end
