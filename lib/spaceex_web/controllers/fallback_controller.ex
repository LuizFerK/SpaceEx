defmodule SpaceexWeb.FallbackController do
  use SpaceexWeb, :controller

  alias Spaceex.Error
  alias SpaceexWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
