defmodule BioskopWeb.MovieController do
  use BioskopWeb, :controller

  def index(conn, _params) do
    movies = [
      %{
        id: 1,
        title: "Moj Film #1",
        description: "A fun movie.",
        rating: "E",
        score_user: 10.0,
        score_critics: 8.3
      },
      %{
        id: 2,
        title: "Moj Film #2",
        description: "A fun movie 2.",
        rating: "M",
        score_user: 5.3,
        score_critics: 3.3
      }
    ]

    render(conn, movies: movies)
  end
end
