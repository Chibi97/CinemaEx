defmodule Bioskop.Movies do
  alias Bioskop.Repo
  alias Bioskop.Movies.Movie
  def list_movies() do
    Repo.all(Movie)
  end

  def create_movie(movie) do
    %Movie{}
      |> Movie.changeset(movie)
      |> Repo.insert()
  end
end
