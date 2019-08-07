defmodule BioskopWeb.MovieController do
  use BioskopWeb, :controller
  alias Bioskop.Movies

  def index(conn, _params) do
    movies = Movies.list_movies()
    render(conn, movies: movies)
  end

  def show(conn, %{"id" => id}) do
    movie = Movies.get_movie!(id)
    render(conn, movie: movie)
  end

  def create(conn, params) do
    case Movies.create_movie(params) do
      {:ok, _} -> conn |> send_resp(201, "")
      {:error, changeset} -> _error_resp(conn, changeset)

    end
  end

  def update(conn, %{"id" => id} = params) do
    movie = Movies.get_movie!(id)
    case Movies.update_movie(movie, params) do
      {:ok, _} -> conn |> send_resp(204, "")
      {:error, changeset} -> _error_resp(conn, changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    movie = Movies.get_movie!(id)
    Movies.delete_movie!(movie)
    send_resp(conn, 204, "")
  end

  defp _error_resp(conn, changeset) do
    conn
      |> put_status(400)
      |> render("error.json", errors: translate(changeset))
  end

end
