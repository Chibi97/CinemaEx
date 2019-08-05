defmodule BioskopWeb.MovieView do
  use BioskopWeb, :view

  alias BioskopWeb.MovieFormatter

  # phoenix converts the keyword list into a map for us!
  def render("index.json", %{movies: movies}) do
    MovieFormatter.format_list(movies)
  end

  def render("error.json", %{errors: errors}) do
    %{errors: errors}
  end
end
