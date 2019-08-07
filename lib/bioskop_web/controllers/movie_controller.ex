defmodule BioskopWeb.MovieController do
  use BioskopWeb, :controller
  alias Bioskop.Movies

  def index(conn, _params) do
    movies = Movies.list_movies()
    render(conn, movies: movies)
  end

  def create(conn, params) do
    case Movies.create_movie(params) do
      {:ok, _} -> conn |> send_resp(201, "")
      {:error, changeset} ->
        conn
          |> put_status(400)
          |> render("error.json", errors: translate(changeset))
    end
  end

end
