defmodule BioskopWeb.MovieFormatter do
  use BioskopWeb.Formatter

  def format_list(movies) when is_list(movies) do
    movies_list =
      movies
      |> Enum.map(&_format/1)

    metadata(length(movies_list), movies_list, :movies)
  end

  defp _format(movie) do
    %{
      title: movie.name,
      summarry: movie.description,
      duration: "#{movie.duration}min"
    }
  end
end
