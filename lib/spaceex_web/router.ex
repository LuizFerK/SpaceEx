defmodule SpaceexWeb.Router do
  use SpaceexWeb, :router

  alias SpaceexWeb.Plugs.IDChecker

  pipeline :api do
    plug :accepts, ["json"]
    plug IDChecker
  end

  pipeline :docs do
    plug OpenApiSpex.Plug.PutApiSpec, module: SpaceexWeb.ApiSpec
  end

  scope "/", SpaceexWeb do
    pipe_through :api

    get "/", WelcomeController, :index
    resources "/articles", ArticlesController, except: [:new, :edit]
  end

  scope "/" do
    pipe_through :docs

    get "/docs/json", OpenApiSpex.Plug.RenderSpec, []
    get "/docs", OpenApiSpex.Plug.SwaggerUI, path: "/docs/json"
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      # coveralls-ignore-start
      live_dashboard "/dashboard", metrics: SpaceexWeb.Telemetry
      # coveralls-ignore-stop
    end
  end
end
