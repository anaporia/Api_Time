defmodule ProjetApi.Repo do
  use Ecto.Repo,
    otp_app: :projet_api,
    adapter: Ecto.Adapters.Postgres
end
