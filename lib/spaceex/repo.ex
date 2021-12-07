defmodule Spaceex.Repo do
  use Ecto.Repo,
    otp_app: :spaceex,
    adapter: Ecto.Adapters.Postgres
end
