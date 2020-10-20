defmodule ProjetApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
  
    create table(:users) do
      add :username, :string, null: false
      add :email, :string, null: false

      timestamps()
    end
    
    create constraint(
      :users,
      :string,
      check: "email ~ '^([a-zA-Z0-9_\-]+\.)*[a-zA-Z0-9_\-]+@([a-zA-Z0-9_\-]+\.)+([a-zA-Z0-9_\-])'"
    )

  end
end
