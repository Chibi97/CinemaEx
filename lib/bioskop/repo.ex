defmodule Bioskop.Repo do
  use Ecto.Repo,
    otp_app: :bioskop,
    adapter: Ecto.Adapters.Postgres
end
