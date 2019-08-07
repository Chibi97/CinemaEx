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
      summary: movie.description,
      duration: "#{movie.duration}min"
    } |> _maybe_score(movie)
  end

  defp _maybe_score(dto, %{score_pro: nil, score_user: nil}) do
    Map.put(dto, :score, nil)
  end
  defp _maybe_score(dto, %{score_pro: score_pro, score_user: score_user}) do
    score = %{ user: score_user, reviewers: score_pro}
    Map.put(dto, :score, score)
  end
end
