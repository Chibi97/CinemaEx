defmodule BioskopWeb.Controllers.Utils do

  def translate(changeset) do
    Ecto.Changeset.traverse_errors(changeset, &_translate_error/1)
  end

  defp _translate_error({message, opts}) do
    case opts[:count] do
      nil -> Gettext.dgettext(BioskopWeb.Gettext, "errors", message, opts)
      count -> Gettext.dngettext(BioskopWeb.Gettext, "errors", message, message, count, opts)
    end
  end
end
