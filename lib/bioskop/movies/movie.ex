defmodule Bioskop.Movies.Movie do
  @moduledoc """
    This module is private.
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias Bioskop.Movies.Movie

  schema "movies" do
    field :name, :string
    field :description, :string
    field :duration, :integer
    field :score_user, :decimal
    field :score_pro, :decimal
    timestamps()
  end

  def changeset(%Movie{} = movie, attrs \\ %{}) do
    movie
      |> cast(attrs, [:name, :description, :duration])
      |> validate_required([:name, :description, :duration])
  end

end
