defmodule BioskopWeb.MovieView do
  use BioskopWeb, :view

  alias BioskopWeb.MovieFormatter

  def render("index.json", %{movies: movies}) do
    MovieFormatter.format_list(movies)
  end
end
