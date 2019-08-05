defmodule BioskopWeb.MovieFormatter do
  use BioskopWeb.Formatter

  def format_list(movies) when is_list(movies) do
    movies_list =
      movies
      |> Enum.map(&_drop_id/1)
      |> Enum.map(&_nest_score/1)

    metadata(length(movies_list), movies_list, :movies)
  end

  defp _drop_id(movie), do: Map.delete(movie, :id)

  defp _nest_score(movie) do
    %{score_user: score_user, score_critics: score_critics} = movie

    movie
    |> Map.drop([:score_user, :score_critics])
    |> Map.put(:score, %{user: score_user, critics: score_critics})
  end
end
