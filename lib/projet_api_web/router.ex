defmodule ProjetApiWeb.Router do
  use ProjetApiWeb, :router

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

  scope "/", ProjetApiWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", ProjetApiWeb do
    pipe_through :api

    scope "/users" do
      get "/", UserController, :show_by_email_username
      get "/:userID", UserController, :show
      post "/", UserController, :create
      put "/:userID", UserController, :update
      delete "/:userID", UserController, :delete
    end

    scope "/clocks" do 
      get "/:userID", ClockController, :index
      post "/:userID", ClockController, :create
    end
#    resources "/users", UserController, except: [:new, :edit]
#    resources "/clocks", ClockController, except: [:new, :edit]
#    resources "/workingtimes", WorkingtimeController, except: [:new, :edit]
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
      pipe_through :browser
      live_dashboard "/dashboard", metrics: ProjetApiWeb.Telemetry
    end
  end
end
