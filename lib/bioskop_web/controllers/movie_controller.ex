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
        result = changeset |> Ecto.Changeset.traverse_errors(&_translate_error/1)
        conn
          |> put_status(400)
          |> render("error.json", errors: result)
    end
  end

  defp _translate_error({message, opts}) do
    case opts[:count] do
      nil -> Gettext.dgettext(BioskopWeb.Gettext, "errors", message, opts)
      count -> Gettext.dngettext(BioskopWeb.Gettext, "errors", message, message, count, opts)
    end
  end
end
