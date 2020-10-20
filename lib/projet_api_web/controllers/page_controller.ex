defmodule ProjetApiWeb.PageController do
  use ProjetApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
