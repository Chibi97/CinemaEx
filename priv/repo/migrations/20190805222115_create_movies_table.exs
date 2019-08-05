defmodule Bioskop.Repo.Migrations.CreateMoviesTable do
  use Ecto.Migration

  def change do
    create table(:movies) do
      add :name, :string, null: false
      add :description, :string, null: false
      add :duration, :integer, null: false
      add :score_user, :decimal, null: true
      add :score_pro, :decimal, null: true
      timestamps()
    end
  end
end
