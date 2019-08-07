defmodule BioskopWeb.Plug.Lang do
  def init(opts), do: opts

  def call(conn, _) do
    lang = Map.get(conn.params, "lang", "en")
    Gettext.put_locale(BioskopWeb.Gettext, lang)
    conn
  end
end
