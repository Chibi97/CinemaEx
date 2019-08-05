defmodule BioskopWeb.Formatter do
  defmacro __using__(_) do
    quote do
      import BioskopWeb.Formatter
    end
  end

  def metadata(count, data, name \\ :collection) do
    %{
      :count => count,
      "#{name}" => data
    }

    # |> Map.put(name, data)
  end
end
