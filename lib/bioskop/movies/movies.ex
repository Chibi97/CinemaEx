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

  def update_movie(%Movie{} = existingMovie, attrs) do
    existingMovie
      |> Movie.changeset(attrs)
      |> Repo.update()
  end

  def get_movie!(id) do
    Repo.get!(Movie, id)
  end

  def delete_movie!(%Movie{} = existingMovie) do
    Repo.delete!(existingMovie)
  end
end
